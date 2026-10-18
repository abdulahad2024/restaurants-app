import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';

enum ToastType { success, error, warning, info }

class CustomToast {
  CustomToast._();

  static void show({
    required BuildContext context,
    required String message,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 3),
  }) {
    final overlayState = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => _ToastWidget(
        message: message,
        type: type,
        duration: duration,
        onDismiss: () {
          if (overlayEntry.mounted) {
            overlayEntry.remove();
          }
        },
      ),
    );

    overlayState.insert(overlayEntry);
  }
}

class _ToastWidget extends StatefulWidget {
  const _ToastWidget({
    required this.message,
    required this.type,
    required this.duration,
    required this.onDismiss,
  });

  final String message;
  final ToastType type;
  final Duration duration;
  final VoidCallback onDismiss;

  @override
  State<_ToastWidget> createState() => _ToastWidgetState();
}

class _ToastWidgetState extends State<_ToastWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _offsetAnimation;
  late final Animation<double> _fadeAnimation;
  Timer? _timer;
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 350),
      reverseDuration: const Duration(milliseconds: 250),
      vsync: this,
    );

    // Niche theke upore ootha
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeIn,
    ));

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();

    // Shomoy sesh hole nijei bondho hobe (smooth exit shoho)
    _timer = Timer(widget.duration, _close);
  }

  /// Age exit animation cholbe, tarpor overlay theke remove hobe.
  Future<void> _close() async {
    if (_isClosing || !mounted) return;
    _isClosing = true;
    _timer?.cancel();
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final mq = MediaQuery.of(context);

    final config = _getToastConfig(widget.type, colorScheme);
    final surface = isDark ? AppColor.darkCard : AppColor.surface;

    // Halka type-color tint, jate toast ta ke alada kore chena jay
    final background = Color.alphaBlend(
      config.color.withValues(alpha: isDark ? 0.14 : 0.07),
      surface,
    );

    return Stack(
      children: [
        Positioned(
          // Keyboard ba system bar er upore thakbe
          bottom: math.max(mq.padding.bottom, mq.viewInsets.bottom) + 24,
          left: 16,
          right: 16,
          child: Material(
            color: Colors.transparent,
            child: SlideTransition(
              position: _offsetAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                // Left/right e swipe korle toast soray deya jay
                child: Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  onDismissed: (_) => widget.onDismiss(),
                  child: Container(
                    // Full width
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: config.color.withValues(alpha: 0.35),
                        width: 1.2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: isDark
                              ? Colors.black.withValues(alpha: 0.45)
                              : AppColor.shadowDark,
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(17),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 14, 10, 14),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Icon badge
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: config.color,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: config.color
                                            .withValues(alpha: 0.35),
                                        blurRadius: 10,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    config.icon,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // Title + message
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        config.title,
                                        style:
                                        theme.textTheme.titleSmall?.copyWith(
                                          color: config.color,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        widget.message,
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                        theme.textTheme.bodyMedium?.copyWith(
                                          color: colorScheme.onSurface,
                                          height: 1.35,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // Close button
                                InkWell(
                                  onTap: _close,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Icon(
                                      Icons.close_rounded,
                                      size: 20,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Baki shomoy dekhano progress bar
                          TweenAnimationBuilder<double>(
                            tween: Tween(begin: 1.0, end: 0.0),
                            duration: widget.duration,
                            builder: (context, value, _) {
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: FractionallySizedBox(
                                  widthFactor: value,
                                  child: Container(
                                    height: 3,
                                    color: config.color.withValues(alpha: 0.7),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _ToastConfig _getToastConfig(ToastType type, ColorScheme colorScheme) {
    switch (type) {
      case ToastType.success:
        return _ToastConfig(
          icon: Icons.check_circle_rounded,
          color: AppColor.success,
          title: 'Success',
        );
      case ToastType.error:
        return _ToastConfig(
          icon: Icons.error_rounded,
          color: AppColor.error,
          title: 'Error',
        );
      case ToastType.warning:
        return _ToastConfig(
          icon: Icons.warning_rounded,
          color: AppColor.warning,
          title: 'Warning',
        );
      case ToastType.info:
        return _ToastConfig(
          icon: Icons.info_rounded,
          color: colorScheme.primary,
          title: 'Info',
        );
    }
  }
}

class _ToastConfig {
  final IconData icon;
  final Color color;
  final String title;

  _ToastConfig({
    required this.icon,
    required this.color,
    required this.title,
  });
}