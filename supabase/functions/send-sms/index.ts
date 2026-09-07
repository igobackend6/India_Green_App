// Supabase Auth "Send SMS" Hook — delivers Supabase-generated OTPs via APITxT.
//
// Supabase Auth itself still generates the OTP, stores it, verifies it, and
// creates the session (via signInWithOtp / verifyOTP in the app) — this hook
// ONLY swaps out *how the SMS is delivered*, from Supabase's own default
// provider to APITxT's dedicated OTP endpoint.
//
// Docs: https://supabase.com/docs/guides/auth/auth-hooks/send-sms-hook
import { Webhook } from "https://esm.sh/standardwebhooks@1.0.0";

const APITXT_SEND_OTP_URL = "https://apitxt.com/api/sendOTP";

interface HookPayload {
  user: { phone: string };
  sms: { otp: string };
}

Deno.serve(async (req: Request) => {
  const reqId = crypto.randomUUID();

  if (req.method !== "POST") {
    return jsonError(reqId, 405, "Method not allowed");
  }

  // 1. Verify this request genuinely came from Supabase Auth. Without this,
  // anyone who finds this URL could make it fire arbitrary SMS at our cost.
  const hookSecretRaw = Deno.env.get("SEND_SMS_HOOK_SECRET");
  if (!hookSecretRaw) {
    console.error(`[${reqId}] SEND_SMS_HOOK_SECRET is not configured`);
    return jsonError(reqId, 500, "Hook secret not configured");
  }

  const payloadText = await req.text();
  const headers = Object.fromEntries(req.headers);

  let verified: HookPayload;
  try {
    const wh = new Webhook(hookSecretRaw.replace("v1,whsec_", ""));
    verified = wh.verify(payloadText, headers) as HookPayload;
  } catch (e) {
    console.warn(`[${reqId}] Signature verification failed:`, (e as Error).message);
    return jsonError(reqId, 401, "Invalid webhook signature");
  }

  const phone = verified?.user?.phone;
  const otp = verified?.sms?.otp;
  if (!phone || !otp) {
    console.warn(`[${reqId}] Verified payload missing phone/otp`, verified);
    return jsonError(reqId, 400, "Missing 'phone' or 'otp' in payload");
  }

  // APITxT expects the mobile number without a leading '+'.
  const mobile = phone.replace(/^\+/, "");

  const authKey = Deno.env.get("APITXT_AUTH_KEY");
  if (!authKey) {
    console.error(`[${reqId}] APITXT_AUTH_KEY is not configured`);
    return jsonError(reqId, 500, "SMS provider not configured");
  }

  // 2. Deliver the OTP via APITxT's dedicated OTP endpoint.
  const controller = new AbortController();
  const timeoutId = setTimeout(() => controller.abort(), 10_000);

  try {
    console.log(`[${reqId}] Sending OTP via APITxT to ${mobile}`);

    const response = await fetch(APITXT_SEND_OTP_URL, {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: new URLSearchParams({ authkey: authKey, mobile, otp }),
      signal: controller.signal,
    });
    clearTimeout(timeoutId);

    const result = await response.json().catch(() => null);

    if (!response.ok || result?.status !== "success") {
      console.error(`[${reqId}] APITxT send failed (HTTP ${response.status}):`, result);
      return jsonError(
        reqId,
        502,
        `SMS provider error: ${result?.message ?? `HTTP ${response.status}`}`,
      );
    }

    console.log(`[${reqId}] OTP delivered. request_id=${result?.data?.request_id}`);
    return new Response(JSON.stringify({}), {
      status: 200,
      headers: { "Content-Type": "application/json" },
    });
  } catch (e) {
    clearTimeout(timeoutId);
    const error = e as Error;
    if (error.name === "AbortError") {
      console.error(`[${reqId}] APITxT request timed out`);
      return jsonError(reqId, 504, "SMS gateway timeout");
    }
    console.error(`[${reqId}] Unexpected error:`, error.message);
    return jsonError(reqId, 500, "Internal server error");
  }
});

function jsonError(reqId: string, httpCode: number, message: string): Response {
  console.error(`[${reqId}] Returning error ${httpCode}: ${message}`);
  return new Response(
    JSON.stringify({ error: { http_code: httpCode, message } }),
    { status: httpCode, headers: { "Content-Type": "application/json" } },
  );
}
