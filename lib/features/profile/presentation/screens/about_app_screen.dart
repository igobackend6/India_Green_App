import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
        title: const Text(
          'About India Green App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Banner ────────────────────────────────────────────────
            _HeroBanner().animate().fadeIn(duration: 400.ms),

            const SizedBox(height: 20),

            // ── Mission ────────────────────────────────────────────────────
            _SectionCard(
              icon: Icons.flag_rounded,
              iconColor: AppColors.forestGreen,
              title: 'Our Mission',
              delay: 100,
              child: const Text(
                'India Green (IGO) exists to transform Indian agriculture by putting the full power of modern agritech into the hands of every farmer, entrepreneur, and partner. We bridge the gap between traditional farming wisdom and cutting-edge technology — making precision agriculture, market access, quality inputs, professional training, and financial services accessible to anyone growing something in India.',
                style: TextStyle(height: 1.65, fontSize: 14),
              ),
            ),

            // ── What is India Green App ────────────────────────────────────
            _SectionCard(
              icon: Icons.smartphone_rounded,
              iconColor: Color(0xFF1565C0),
              title: 'What is the India Green App?',
              delay: 150,
              child: const Text(
                'The India Green App is an agritech super-app developed by IGO Group — a one-stop platform that serves farmers, farm entrepreneurs, agri-businesses, vendors, and investors. With a single sign-in you get access to India\'s most comprehensive agri ecosystem: a marketplace, project gallery, professional services, learning academy, AI-powered crop diagnostics, live market prices, and the entire IGO brand universe.',
                style: TextStyle(height: 1.65, fontSize: 14),
              ),
            ),

            // ── Core Features ──────────────────────────────────────────────
            _SectionCard(
              icon: Icons.grid_view_rounded,
              iconColor: Color(0xFF388E3C),
              title: 'Core Features',
              delay: 200,
              child: Column(
                children: const [
                  _FeatureRow(
                    icon: Icons.agriculture_rounded,
                    color: Color(0xFF2E7D32),
                    title: 'Projects Gallery',
                    desc: 'Browse real completed IGO projects across Agri Farming, Aquaculture, Livestock, and Farm Engineering — with detailed subcategories and direct enquiry links.',
                  ),
                  _FeatureRow(
                    icon: Icons.miscellaneous_services_rounded,
                    color: Color(0xFF0277BD),
                    title: 'Professional Services',
                    desc: 'End-to-end agri services including Farm Planning & Consulting, Project Setup, Farm Infrastructure construction, and Annual Maintenance Contracts (AMC).',
                  ),
                  _FeatureRow(
                    icon: Icons.store_rounded,
                    color: Color(0xFFE65100),
                    title: 'IGO Agri Mart',
                    desc: 'A fully stocked agri inputs marketplace covering Seeds, Polyhouse Structures, Control & Automation, Digital Agri & IoT, Horticulture Catalog, and Post-Harvest & Legacy products.',
                  ),
                  _FeatureRow(
                    icon: Icons.school_rounded,
                    color: Color(0xFF6A1B9A),
                    title: 'IGO Academy',
                    desc: 'Certified hands-on training programs in Polyhouse Farming, Hydroponics, Aquaculture, Vertical Farming, Mushroom Cultivation, Livestock, Microgreens, Drip Irrigation, and Agri Entrepreneurship.',
                  ),
                  _FeatureRow(
                    icon: Icons.psychology_rounded,
                    color: Color(0xFF00695C),
                    title: 'AI Crop Doctor',
                    desc: 'AI-powered plant disease detection — photograph your crop, get an instant diagnosis, treatment recommendation, and preventive care advice.',
                  ),
                  _FeatureRow(
                    icon: Icons.trending_up_rounded,
                    color: Color(0xFFB71C1C),
                    title: 'Farm Gate Mandi',
                    desc: 'Live commodity prices and a direct farmer-to-buyer marketplace — sell your produce at the best price with zero middlemen.',
                  ),
                  _FeatureRow(
                    icon: Icons.notifications_active_rounded,
                    color: Color(0xFFF57C00),
                    title: 'Smart Notifications',
                    desc: 'Real-time price alerts, scheme reminders, weather advisories, and IGO event notifications delivered directly to your device.',
                  ),
                ],
              ),
            ),

            // ── IGO Universe ───────────────────────────────────────────────
            _SectionCard(
              icon: Icons.hub_rounded,
              iconColor: Color(0xFF4527A0),
              title: 'The IGO Universe — 29 Brands',
              delay: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'India Green is not just one company — it is an ecosystem of 29 specialised brands, each serving a distinct segment of Indian agriculture and agri-business:',
                    style: TextStyle(height: 1.65, fontSize: 14),
                  ),
                  const SizedBox(height: 12),
                  _BrandGrid(brands: const [
                    'IGO Agri Mart',         'Farm Gate Mandi',
                    'IGO Nursery',           'IGO Farmlands',
                    'IGO Fintech',           'Palm Cafe',
                    'IGO Academy',           'IGO Biotech',
                    'IGO Exports',           'IGO Logistics',
                    'Soil Sense',            'IGO Agritech Farms',
                    'IGO Farm Factories',    'IGO Farm Automation',
                    'Farmer Factory',        'Protein Cuts',
                    'IGO Organic Pharmacy',  'IGO Natural Cosmetics',
                    'India Green',           'Valluvam',
                    'IGO Green Energy',      'IGO Crop Care',
                    'IGO Franchise',         'India Green Organics',
                    'IGO Farm Loans\n& Grants', 'IGO Wealth\nManagement',
                    'Tech Farming Expert',   'Tech Farming\nScientists Fdn.',
                    'IGO Mart',
                  ]),
                ],
              ),
            ),

            // ── Why IGO ────────────────────────────────────────────────────
            _SectionCard(
              icon: Icons.verified_rounded,
              iconColor: Color(0xFF00796B),
              title: 'Why Choose India Green?',
              delay: 300,
              child: Column(
                children: const [
                  _BulletPoint(
                    text: 'Field-tested expertise — IGO has designed, built, and operated hundreds of polyhouses, aquaculture units, livestock farms, and open-field projects across India.',
                  ),
                  _BulletPoint(
                    text: 'End-to-end support — from land survey and farm layout to construction, crop management, marketing, and maintenance, IGO supports every stage of the farming journey.',
                  ),
                  _BulletPoint(
                    text: 'Technology-first — AI diagnostics, IoT sensors, automated fertigation, and software dashboards are integrated into real farm operations, not just offered as products.',
                  ),
                  _BulletPoint(
                    text: 'Multilingual — the app speaks Tamil, Hindi, Telugu, Kannada, Malayalam, Marathi, Bengali, Gujarati, Punjabi, Odia, Assamese, and English, ensuring every Indian farmer feels at home.',
                  ),
                  _BulletPoint(
                    text: 'Farmer-first financial access — through IGO Fintech and Farm Loans & Grants, we connect farmers with credit, subsidies, and investment opportunities tailored for agriculture.',
                  ),
                  _BulletPoint(
                    text: 'Trusted supply chain — IGO Mart and IGO Agri Mart source quality-certified seeds, nutrients, and equipment, eliminating counterfeit inputs from the farm.',
                  ),
                ],
              ),
            ),

            // ── Vision ─────────────────────────────────────────────────────
            _SectionCard(
              icon: Icons.remove_red_eye_rounded,
              iconColor: Color(0xFF283593),
              title: 'Our Vision',
              delay: 350,
              child: const Text(
                '"To make Indian agriculture profitable, sustainable, and dignified — by creating an integrated ecosystem where every farmer has access to world-class technology, knowledge, capital, and markets."\n\nWe envision a future where a smallholder farmer in rural Tamil Nadu has the same access to precision farming tools, expert consulting, and global export channels as the largest corporate farm — all through one app.',
                style: TextStyle(height: 1.65, fontSize: 14),
              ),
            ),

            // ── Contact / Version ──────────────────────────────────────────
            _SectionCard(
              icon: Icons.contact_support_rounded,
              iconColor: AppColors.harvestGold,
              title: 'Contact & Version',
              delay: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _InfoRow(icon: Icons.language_rounded,     label: 'Website',  value: 'www.igoagritechfarms.in'),
                  _InfoRow(icon: Icons.email_rounded,        label: 'Email',    value: 'info@igoagritechfarms.in'),
                  _InfoRow(icon: Icons.business_rounded,     label: 'Group',    value: 'India Green Organics (IGO Group)'),
                  _InfoRow(icon: Icons.place_rounded,        label: 'Based in', value: 'Tamil Nadu, India 🇮🇳'),
                  _InfoRow(icon: Icons.new_releases_rounded, label: 'Version',  value: '1.0.0'),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // ── Footer ─────────────────────────────────────────────────────
            Center(
              child: Text(
                '© 2025 India Green Organics (IGO Group)\nOne App. Every Farmer. Every Partner.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.textMuted,
                  height: 1.6,
                ),
              ),
            ).animate(delay: 450.ms).fadeIn(),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

// ── Hero Banner ───────────────────────────────────────────────────────────────

class _HeroBanner extends StatelessWidget {
  const _HeroBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.forestGreen, Color(0xFF1B5E20)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.forestGreen.withValues(alpha: 0.3),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Logo circle
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 2),
            ),
            child: const Center(
              child: Text('🌱', style: TextStyle(fontSize: 34)),
            ),
          ),
          const SizedBox(height: 14),
          const Text(
            'India Green App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'One App. Every Farmer. Every Partner.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 13,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 16),
          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _StatChip(label: '29', sublabel: 'Brands'),
              _StatChip(label: '16', sublabel: 'Modules'),
              _StatChip(label: '12', sublabel: 'Languages'),
              _StatChip(label: '10+', sublabel: 'Courses'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String sublabel;
  const _StatChip({required this.label, required this.sublabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          sublabel,
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.75),
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

// ── Section Card ──────────────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final Widget child;
  final int delay;

  const _SectionCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.child,
    this.delay = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          DefaultTextStyle(
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
            child: child,
          ),
        ],
      ),
    ).animate(delay: Duration(milliseconds: delay)).fadeIn(duration: 350.ms).slideY(begin: 0.06);
  }
}

// ── Feature Row ───────────────────────────────────────────────────────────────

class _FeatureRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String desc;
  const _FeatureRow({
    required this.icon,
    required this.color,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 34,
            height: 34,
            margin: const EdgeInsets.only(top: 1),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Bullet Point ──────────────────────────────────────────────────────────────

class _BulletPoint extends StatelessWidget {
  final String text;
  const _BulletPoint({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 7,
            height: 7,
            margin: const EdgeInsets.only(top: 6),
            decoration: const BoxDecoration(
              color: AppColors.growthGreen,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13.5,
                color: AppColors.textSecondary,
                height: 1.55,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Brand Grid ────────────────────────────────────────────────────────────────

class _BrandGrid extends StatelessWidget {
  final List<String> brands;
  const _BrandGrid({required this.brands});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: brands
          .map(
            (b) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.forestGreen.withValues(alpha: 0.07),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                    color: AppColors.forestGreen.withValues(alpha: 0.2)),
              ),
              child: Text(
                b,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 11.5,
                  fontWeight: FontWeight.w600,
                  color: AppColors.forestGreen,
                  height: 1.3,
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}

// ── Info Row ──────────────────────────────────────────────────────────────────

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRow({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 17, color: AppColors.forestGreen),
          const SizedBox(width: 10),
          Text(
            '$label:  ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: AppColors.textPrimary,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
