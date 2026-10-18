import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';

class FoodHero extends StatelessWidget {
  final double height;
  final bool isDark;

  const FoodHero({
    super.key,
    required this.height,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final surface = Theme.of(context).colorScheme.surface;
    final circle = height * 0.82;
    final tile = (height * 0.24).clamp(40.0, 52.0);

    Widget floatingTile(IconData icon, Alignment alignment, double angle) {
      return Align(
        alignment: alignment,
        child: Transform.rotate(
          angle: angle,
          child: Container(
            height: tile,
            width: tile,
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(tile * 0.32),
              border: Border.all(
                color: AppColor.primary.withValues(alpha : isDark ? 0.35 : 0.15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha:isDark ? 0.3 : 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Icon(icon, color: AppColor.primary, size: tile * 0.5),
          ),
        ),
      );
    }

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Outer soft ring
          Container(
            height: circle,
            width: circle,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primary.withOpacity(isDark ? 0.10 : 0.07),
            ),
          ),
          // Inner circle
          Container(
            height: circle * 0.68,
            width: circle * 0.68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primary.withOpacity(isDark ? 0.16 : 0.12),
            ),
          ),
          // Main icon
          Container(
            height: circle * 0.42,
            width: circle * 0.42,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColor.primary,
                  AppColor.primary.withOpacity(0.78),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColor.primary.withOpacity(0.35),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              Ionicons.fastFood,
              color: Colors.white,
              size: circle * 0.2,
            ),
          ),

          // Floating tiles
          floatingTile(Ionicons.pizza, const Alignment(-0.78, -0.55), -0.12),
          floatingTile(Ionicons.cafe, const Alignment(0.80, -0.70), 0.10),
          floatingTile(Ionicons.iceCream, const Alignment(-0.62, 0.72), 0.08),
          floatingTile(Ionicons.restaurant, const Alignment(0.72, 0.58), -0.10),
        ],
      ),
    );
  }
}