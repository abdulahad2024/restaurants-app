import 'package:flutter/material.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/glow_circle.dart';

class WelcomeBackground extends StatelessWidget {
  final bool isDark;

  const WelcomeBackground({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -90,
          right: -70,
          child: GlowCircle(
            size: 260,
            color: AppColor.primary.withValues(alpha: isDark ? 0.18 : 0.12),
          ),
        ),
        Positioned(
          top: 120,
          left: -110,
          child: GlowCircle(
            size: 200,
            color: AppColor.primary.withValues(alpha: isDark ? 0.10 : 0.07),
          ),
        ),
      ],
    );
  }
}