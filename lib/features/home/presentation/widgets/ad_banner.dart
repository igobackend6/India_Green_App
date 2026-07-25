import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';

// ── Ad data ───────────────────────────────────────────────────────────────────

final _ads = <String>[
  'assets/images/Ad_image/Ad_Image1.png',
  'assets/images/Ad_image/Ad_image2.png',
  'assets/images/Ad_image/Ad_image3.png',
  'assets/images/Ad_image/Ad_image4.jpeg',
];

// ── Widget ────────────────────────────────────────────────────────────────────

class AdBanner extends StatefulWidget {
  const AdBanner({super.key});

  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  late final PageController _ctrl;
  int _current = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Start at a large offset so we can scroll both ways seamlessly
    _ctrl = PageController(initialPage: _ads.length * 100);
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (_) {
      if (!mounted) return;
      _ctrl.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Rectangle banner ──────────────
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            height: 190,
            child: PageView.builder(
              controller: _ctrl,
              onPageChanged: (p) => setState(() => _current = p % _ads.length),
              itemBuilder: (ctx, i) {
                final adPath = _ads[i % _ads.length];
                return _AdSlide(imagePath: adPath);
              },
            ),
          ),
        ),

        const SizedBox(height: 10),

        // ── Dot indicators ────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_ads.length, (i) {
            final active = i == _current;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: active ? 22 : 7,
              height: 7,
              decoration: BoxDecoration(
                color: active
                    ? AppColors.forestGreen
                    : AppColors.forestGreen.withValues(alpha: 0.25),
                borderRadius: BorderRadius.circular(4),
              ),
            );
          }),
        ),
      ],
    );
  }
}

// ── Single ad slide ───────────────────────────────────────────────────────────

class _AdSlide extends StatelessWidget {
  final String imagePath;
  const _AdSlide({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade200, // placeholder background
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
