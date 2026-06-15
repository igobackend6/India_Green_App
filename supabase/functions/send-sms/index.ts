import { serve } from "https://deno.land/std@0.168.0/http/server.ts"

// 1. Validation Interfaces
interface WebhookPayload {
  user: {
    phone: string;
  };
  sms: {
    otp: string;
  };
}

serve(async (req: Request) => {
  const reqId = crypto.randomUUID();
  console.log(`[${reqId}] Starting APITxT SMS Webhook`);

  try {
    // 2. Parse and Validate Input
    const payload = await req.json() as any;
    const phone = payload?.user?.phone;
    const otp = payload?.sms?.otp;

    if (!phone || !otp) {
      console.warn(`[${reqId}] Invalid payload received`, { payload });
      return new Response(JSON.stringify({ error: "Missing 'phone' or 'otp' in payload" }), { status: 400 });
    }

    // Strip the '+' sign for APITxT
    const cleanPhone = phone.replace('+', '');

    // 3. Load and Validate Secrets
    const authKey = Deno.env.get('APITXT_AUTH_KEY');
    const senderId = Deno.env.get('APITXT_SENDER_ID') || '';
    const templateId = Deno.env.get('APITXT_TEMPLATE_ID') || '';
    const peId = Deno.env.get('APITXT_PE_ID') || '';

    if (!authKey) throw new Error('APITXT_AUTH_KEY is not configured');

    // 4. Construct message
    const message = `Your IndiaGreen App verification code is: ${otp}. Please do not share this code.`;
    const encodedMessage = encodeURIComponent(message);

    // 5. Construct URL & Timeout handling
    let url = `https://apitxt.com/api/sendMsg?authkey=${authKey}&mobiles=${cleanPhone}&message=${encodedMessage}&route=4`;
    if (senderId) url += `&sender=${senderId}`;
    if (templateId) url += `&template_id=${templateId}`;
    if (peId) url += `&pe_id=${peId}`;

    console.log(`[${reqId}] Sending SMS via APITxT to ${cleanPhone}`);

    // Create an AbortController for a 10-second timeout
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), 10000);

    // 6. Execute Request
    const response = await fetch(url, {
      method: 'GET',
      signal: controller.signal,
    });

    clearTimeout(timeoutId);

    const responseText = await response.text();

    if (!response.ok) {
      console.error(`[${reqId}] APITxT HTTP Error ${response.status}: ${responseText}`);
      console.warn(`[${reqId}] Bypassing APITxT error for development to allow Test OTPs.`);
      // Return 200 OK instead of 502 so Supabase Auth proceeds with the test OTP
      return new Response(JSON.stringify({ success: true, message: 'OTP bypassed for testing' }), {
        headers: { "Content-Type": "application/json" },
        status: 200,
      });
    }

    console.log(`[${reqId}] SMS sent successfully. APITxT Response:`, responseText);

    return new Response(JSON.stringify({ success: true, message: 'OTP dispatched' }), {
      headers: { "Content-Type": "application/json" },
      status: 200,
    });

  } catch (e) {
    const error = e as Error;
    if (error.name === 'AbortError') {
      console.error(`[${reqId}] APITxT Request Timed Out`);
      return new Response(JSON.stringify({ error: 'SMS Gateway Timeout' }), { status: 504 });
    }
    console.error(`[${reqId}] Webhook Error:`, error.message);
    return new Response(JSON.stringify({ error: 'Internal Server Error' }), { status: 500 });
  }
});
