import 'package:flutter/material.dart';
import 'package:india_green_app/core/utils/url_launcher_helper.dart';

class ProjectItemData {
  final String name;
  final String? url;
  final String? image;

  const ProjectItemData({required this.name, this.url, this.image});
}

class ProjectSubCategoryScreen extends StatelessWidget {
  final String title;
  final Color color;
  final List<ProjectItemData> items;

  const ProjectSubCategoryScreen({
    super.key,
    required this.title,
    required this.color,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: color,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${items.length} projects',
              style: theme.textTheme.labelSmall?.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          return _ProjectCard(
            item: item,
            color: color,
            onTap: () {
              if (item.url != null) {
                launchInAppWebView(context, item.url!, item.name);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} — coming soon'),
                    duration: const Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final ProjectItemData item;
  final Color color;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.item,
    required this.color,
    required this.onTap,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasUrl = widget.item.url != null;
    final hasImage = widget.item.image != null && widget.item.image!.isNotEmpty;

    return Listener(
      onPointerDown: (_) => setState(() => _isPressed = true),
      onPointerUp: (_) => setState(() => _isPressed = false),
      onPointerCancel: (_) => setState(() => _isPressed = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          decoration: BoxDecoration(
            color: _isPressed ? widget.color : theme.cardColor,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: _isPressed
                  ? widget.color
                  : widget.color.withValues(alpha: 0.12),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasImage)
                  Stack(
                    children: [
                      Image.asset(
                        widget.item.image!,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          height: 160,
                          width: double.infinity,
                          color: widget.color.withValues(alpha: 0.1),
                          child: Icon(Icons.broken_image_rounded, color: widget.color, size: 40),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 60,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                (_isPressed ? widget.color : theme.cardColor)
                                    .withValues(alpha: 0.9),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                else
                  Container(
                    height: 120,
                    width: double.infinity,
                    color: widget.color.withValues(alpha: 0.1),
                    child: Icon(Icons.image_not_supported_rounded, color: widget.color.withValues(alpha: 0.5), size: 40),
                  ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _isPressed
                              ? Colors.white.withValues(alpha: 0.2)
                              : widget.color.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.assignment_rounded,
                          color: _isPressed
                              ? Colors.white
                              : widget.color,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.item.name,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: _isPressed
                                    ? Colors.white
                                    : (hasUrl ? theme.colorScheme.onSurface : theme.colorScheme.onSurface.withValues(alpha: 0.6)),
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              'Tap to explore project details',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: _isPressed
                                    ? Colors.white70
                                    : theme.colorScheme.onSurface.withValues(alpha: 0.5),
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        hasUrl ? Icons.arrow_forward_ios_rounded : Icons.lock_outline_rounded,
                        size: 14,
                        color: _isPressed
                            ? Colors.white
                            : widget.color,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
