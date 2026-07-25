import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/theme/app_colors.dart';

// ── Brand data ────────────────────────────────────────────────────────────────

typedef _Brand = ({
  String name,
  String tag,
  String desc,
  String emoji,
  String? url,
  Color accent,
});

final _brands = <_Brand>[
  (
    name: 'IGO Agri Mart',
    tag: 'RECOMMENDED',
    desc: 'Your one-stop agri inputs retail network — seeds, nutrients, polyhouse materials and more.',
    emoji: '🏪',
    url: 'https://igoagri-mart-website.vercel.app/',
    accent: AppColors.forestGreen,
  ),
  (
    name: 'Farm Gate Mandi',
    tag: 'POPULAR',
    desc: 'Direct farmer-to-buyer marketplace. Sell your produce at the best price with zero middlemen.',
    emoji: '⚖️',
    url: 'https://farmgatemandi.com/',
    accent: Color(0xFFE65100),
  ),
  (
    name: 'IGO Nursery',
    tag: '',
    desc: 'Premium plant saplings, micro-greens and ornamental plants delivered to your farm.',
    emoji: '🌱',
    url: 'https://igonursery.com/',
    accent: Color(0xFF2E7D32),
  ),
  (
    name: 'IGO Farmlands',
    tag: 'PREMIUM',
    desc: 'Modern lease farming system — invest in premium farmlands and earn consistent returns.',
    emoji: '🌾',
    url: 'https://igoagriestate.com/',
    accent: AppColors.harvestGold,
  ),
  (
    name: 'IGO Fintech',
    tag: '',
    desc: 'Credit, loans, and financial products designed specifically for Indian agriculture.',
    emoji: '💳',
    url: 'https://igofarmloans.com/',
    accent: Color(0xFF1565C0),
  ),
  (
    name: 'Palm Cafe',
    tag: '',
    desc: 'Organic farm-to-table café chain bringing the freshest produce straight to your plate.',
    emoji: '☕',
    url: 'https://palmcafe-landingpage.vercel.app/',
    accent: Color(0xFF4E342E),
  ),
  (
    name: 'IGO Academy',
    tag: '',
    desc: 'Agritech education and certifications — learn modern farming techniques and grow your skills.',
    emoji: '🎓',
    url: 'https://igoacademy.in/',
    accent: Color(0xFF6A1B9A),
  ),
  (
    name: 'IGO Exports',
    tag: '',
    desc: 'Global organic distribution — connecting Indian farmers with international markets.',
    emoji: '🌍',
    url: 'https://igo-import-export-website.vercel.app/',
    accent: Color(0xFF283593),
  ),
  (
    name: 'IGO Agritech Farms',
    tag: '',
    desc: 'Advanced modern agriculture farms.',
    emoji: '🚜',
    url: 'https://www.igoagritechfarms.in/',
    accent: Color(0xFF388E3C),
  ),
  (
    name: 'IGO Farm Factories',
    tag: '',
    desc: 'Innovative indoor and controlled environment farming.',
    emoji: '🏭',
    url: null,
    accent: Color(0xFF455A64),
  ),
  (
    name: 'IGO Farm Automation',
    tag: '',
    desc: 'Smart farm mechanization and automation tools.',
    emoji: '⚙️',
    url: null,
    accent: Color(0xFF1976D2),
  ),
  (
    name: 'Farmer Factory',
    tag: '',
    desc: 'Empowering farmers with modern industrial agricultural tools.',
    emoji: '👷',
    url: 'https://famersfactory.com/',
    accent: Color(0xFFF57C00),
  ),
  (
    name: 'Protein Cuts',
    tag: '',
    desc: 'Premium sustainable protein and livestock products.',
    emoji: '🥩',
    url: 'https://igoproteincuts.com/',
    accent: Color(0xFFD32F2F),
  ),
  (
    name: 'IGO Organic Pharmacy',
    tag: '',
    desc: 'Natural and organic remedies derived from agriculture.',
    emoji: '⚕️',
    url: null,
    accent: Color(0xFF00796B),
  ),
  (
    name: 'IGO Natural Cosmetics',
    tag: '',
    desc: 'Beauty products made from 100% natural and organic ingredients.',
    emoji: '✨',
    url: null,
    accent: Color(0xFFC2185B),
  ),
  (
    name: 'India Green',
    tag: '',
    desc: 'Core agricultural services and comprehensive solutions.',
    emoji: '🇮🇳',
    url: null,
    accent: Color(0xFF388E3C),
  ),
  (
    name: 'Valluvam',
    tag: '',
    desc: 'Traditional agricultural wisdom combined with modern techniques.',
    emoji: '📜',
    url: 'https://www.valluvamproducts.com/',
    accent: Color(0xFF5D4037),
  ),
  (
    name: 'IGO Green Energy',
    tag: '',
    desc: 'Sustainable and renewable energy solutions for farms.',
    emoji: '⚡',
    url: 'https://igo-green-enargy.vercel.app/',
    accent: Color(0xFFFBC02D),
  ),
  (
    name: 'IGO Crop Care',
    tag: '',
    desc: 'Complete crop protection and nutrition solutions.',
    emoji: '🛡️',
    url: 'https://igocropcare.com/',
    accent: Color(0xFF689F38),
  ),
  (
    name: 'IGO Franchise',
    tag: '',
    desc: 'Partner with us to expand agricultural excellence.',
    emoji: '🤝',
    url: null,
    accent: Color(0xFF0288D1),
  ),
  (
    name: 'India Green Organics',
    tag: '',
    desc: 'Certified organic products and sustainable farming produce.',
    emoji: '🌿',
    url: null,
    accent: Color(0xFF2E7D32),
  ),
  (
    name: 'IGO Farm Loans Subsidy & Grants',
    tag: '',
    desc: 'Financial assistance, grants, and subsidies for farmers.',
    emoji: '💰',
    url: 'https://igofarmloans.com/',
    accent: Color(0xFF1565C0),
  ),
  (
    name: 'IGO Wealth Management Service',
    tag: '',
    desc: 'Expert financial planning and wealth management for agri-businesses.',
    emoji: '📈',
    url: null,
    accent: Color(0xFF4527A0),
  ),
  (
    name: 'Tech Farming Expert',
    tag: '',
    desc: 'Consulting services for integrating technology into farming.',
    emoji: '💻',
    url: 'https://igo-tech-farming-experts.vercel.app/',
    accent: Color(0xFF0097A7),
  ),
  (
    name: 'Tech Farming Scientists Foundation',
    tag: '',
    desc: 'Research and development foundation for agricultural sciences.',
    emoji: '🔬',
    url: null,
    accent: Color(0xFF303F9F),
  ),
  (
    name: 'IGO Mart',
    tag: '',
    desc: 'Retail network for agricultural supplies and daily essentials.',
    emoji: '🛒',
    url: null,
    accent: Color(0xFFE65100),
  ),
];

final Map<String, String> _brandLogos = {
  'Farm Gate Mandi': 'assets/images/IGO Universe Brands/Farm Gate Mandi.jpg',
  'Farmer Factory': 'assets/images/IGO Universe Brands/Farmer Factory.jpg',
  'IGO Academy': 'assets/images/IGO Universe Brands/IGO Academy.jpg',
  'IGO Agri Mart': 'assets/images/IGO Universe Brands/IGO Agri Mart.jpg',
  'IGO Agritech Farms': 'assets/images/IGO Universe Brands/IGO Agritech Farms.jpg',
  'IGO Crop Care': 'assets/images/IGO Universe Brands/IGO Crop Care.jpg',
  'IGO Exports': 'assets/images/IGO Universe Brands/IGO Exports.jpg',
  'IGO Farm Automation': 'assets/images/IGO Universe Brands/IGO Farm Automation.jpg',
  'IGO Farm Factories': 'assets/images/IGO Universe Brands/IGO Farm Factories.jpg',
  'IGO Farm Loans Subsidy & Grants': 'assets/images/IGO Universe Brands/IGO Farm Loans Subsidy & Grants.jpg',
  'IGO Farmlands': 'assets/images/IGO Universe Brands/IGO Farmlands.jpg',
  'IGO Fintech': 'assets/images/IGO Universe Brands/IGO Fintech.jpg',
  'IGO Franchise': 'assets/images/IGO Universe Brands/IGO Franchise.jpg',
  'IGO Mart': 'assets/images/IGO Universe Brands/IGO Mart.jpg',
  'IGO Natural Cosmetics': 'assets/images/IGO Universe Brands/IGO Natural Cosmetics.jpg',
  'IGO Nursery': 'assets/images/IGO Universe Brands/IGO Nursery.jpg',
  'IGO Organic Pharmacy': 'assets/images/IGO Universe Brands/IGO Organic Pharmacy.jpg',
  'IGO Wealth Management Service': 'assets/images/IGO Universe Brands/IGO Wealth Management Service.jpg',
  'India Green Organics': 'assets/images/IGO Universe Brands/India Green Organics.jpg',
  'Palm Cafe': 'assets/images/IGO Universe Brands/Palm Cafe.jpg',
  'Protein Cuts': 'assets/images/IGO Universe Brands/Protein Cuts.jpg',
  'Tech Farming Expert': 'assets/images/IGO Universe Brands/Tech Farming Expert.jpg',
  'Tech Farming Scientists Foundation': 'assets/images/IGO Universe Brands/Tech Farming Scientists Foundation.jpg',
  'Valluvam': 'assets/images/IGO Universe Brands/Valluvam.jpg',
};

// ── Widget ────────────────────────────────────────────────────────────────────

class BrandCarousel extends StatefulWidget {
  const BrandCarousel({super.key});

  @override
  State<BrandCarousel> createState() => _BrandCarouselState();
}

class _BrandCarouselState extends State<BrandCarousel> {
  late final PageController _ctrl;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _ctrl = PageController(viewportFraction: 0.92);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Full-width brand page ──────────
        SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _ctrl,
            itemCount: _brands.length,
            onPageChanged: (p) => setState(() => _current = p),
            itemBuilder: (ctx, i) => _BrandPage(
              brand: _brands[i],
              isActive: i == _current,
            ),
          ),
        ),

        const SizedBox(height: 12),

        // ── Dot indicators ────────────────
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 8,
          children: List.generate(_brands.length, (i) {
            final active = i == _current;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 3),
              width: active ? 20 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: active
                    ? _brands[_current].accent
                    : _brands[_current].accent.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    ).animate().fadeIn(delay: 250.ms);
  }
}

// ── Single brand page card ────────────────────────────────────────────────────

class _BrandPage extends StatelessWidget {
  final _Brand brand;
  final bool isActive;

  const _BrandPage({required this.brand, required this.isActive});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedScale(
      scale: isActive ? 1.0 : 0.94,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      child: GestureDetector(
        onTap: () async {
          if (brand.url != null) {
            final uri = Uri.parse(brand.url!);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.inAppBrowserView);
            }
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: brand.accent.withValues(alpha: isActive ? 0.45 : 0.15),
              width: isActive ? 1.8 : 1,
            ),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: brand.accent.withValues(alpha: 0.12),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Stack(
            children: [
              // ── Decorative circle ─────────
              Positioned(
                right: -18,
                top: -18,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: brand.accent.withValues(alpha: 0.07),
                  ),
                ),
              ),

              // ── Main content ──────────────
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top row: emoji + tag
                    Row(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: brand.accent.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: _brandLogos.containsKey(brand.name)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(14),
                                    child: Image.asset(_brandLogos[brand.name]!, fit: BoxFit.cover, width: 56, height: 56),
                                  )
                                : Text(brand.emoji,
                                    style: const TextStyle(fontSize: 28)),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                brand.name,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme.colorScheme.onSurface,
                                ),
                              ),
                              if (brand.tag.isNotEmpty)
                                Container(
                                  margin: const EdgeInsets.only(top: 3),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: brand.accent.withValues(alpha: 0.12),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    brand.tag,
                                    style: TextStyle(
                                      color: brand.accent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Description
                    Text(
                      brand.desc,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.65),
                        height: 1.5,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: brand.accent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: brand.accent.withValues(alpha: 0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'More',
                              style: TextStyle(
                                color: brand.accent,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_forward_rounded, size: 14, color: brand.accent),
                          ],
                        ),
                      ).animate(onPlay: (controller) => controller.repeat(reverse: true))
                       .fade(begin: 0.6, end: 1.0, duration: 1200.ms)
                       .shimmer(color: brand.accent.withValues(alpha: 0.3), duration: 2.seconds),
                    ),
                  ],
                ),
              ),

              // ── Bottom accent bar ─────────
              Positioned(
                left: 20,
                bottom: 14,
                child: Container(
                  width: 36,
                  height: 3,
                  decoration: BoxDecoration(
                    color: brand.accent.withValues(alpha: isActive ? 0.7 : 0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
