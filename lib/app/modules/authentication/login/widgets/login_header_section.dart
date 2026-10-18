import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';

class LoginHeaderSection extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const LoginHeaderSection({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Icon Badge
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColor.primary,
                AppColor.primary.withOpacity(0.75),
              ],
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: AppColor.primary.withOpacity(0.35),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(
            Ionicons.person,
            color: Colors.white,
            size: 26,
          ),
        ),

        const SizedBox(height: 24),

        // Title
        Text(
          'Login',
          style: textTheme.headlineLarge?.copyWith(
            fontSize: 34,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.8,
            color: AppColor.primary,
          ),
        ),

        SizedBox(height: AppSize.sm),

        // Subtitle
        RichText(
          text: TextSpan(
            text: 'Welcome back! Please enter your ',
            style: textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
            children: const [
              TextSpan(
                text: 'details',
                style: TextStyle(
                  color: AppColor.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextSpan(text: ' to sign in.'),
            ],
          ),
        ),
      ],
    );
  }
}