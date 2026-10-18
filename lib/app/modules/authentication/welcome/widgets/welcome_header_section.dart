import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/core/app_config/app_config.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/features_chip.dart';

class WelcomeHeaderSection extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const WelcomeHeaderSection({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColor.primary,
                AppColor.primary.withValues(alpha: 0.75),
              ],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary.withValues(alpha: 0.35),
                blurRadius: 24,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Icon(
            Ionicons.restaurant,
            color: Colors.white,
            size: 30,
          ),
        ),

        const SizedBox(height: 28),

        Text(
          'Welcome to',
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          AppConfig.appName,
          style: textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
            height: 1.1,
            color: AppColor.primary,
          ),
        ),

        const SizedBox(height: 20),

        const Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            FeatureChip(
              icon: Ionicons.storefront,
              label: 'Restaurants',
            ),
            FeatureChip(
              icon: Ionicons.fastFood,
              label: 'Orders',
            ),
            FeatureChip(
              icon: Ionicons.receiptOutline,
              label: 'History',
            ),
          ],
        ),
      ],
    );
  }
}