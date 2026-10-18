import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_outlined_button.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/controllers/welcome_controller.dart';
import '../../../../core/constants/app_color.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({ // 👈 এখানে 'new' এর বদলে ক্লাসের নাম দেওয়া হয়েছে
    super.key,
    required this.textTheme,
    required this.isDark,
    required this.colorScheme,
    required this.controller,
  });

  final TextTheme textTheme;
  final bool isDark;
  final ColorScheme colorScheme;
  final WelcomeController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Let’s Get Started...',
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 18),

        CustomButton(
          text: 'Continue with Register',
          textColor: AppColor.white,
          icon:  Ionicons.arrowForward,
          onPressed: () => controller.register(),
        ),

        const SizedBox(height: 14),

        Row(
          children: [
            Expanded(
              child: Divider(
                color: isDark
                    ? AppColor.darkBorder
                    : AppColor.border,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                'or',
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: isDark
                    ? AppColor.darkBorder
                    : AppColor.border,
              ),
            ),
          ],
        ),

        const SizedBox(height: 14),

        CustomOutlinedButton(
          text: 'Continue with Login',
          borderColor: isDark
              ? AppColor.primary
              : AppColor.primary,
          textColor: colorScheme.onSurface,
          icon: const Icon(
            Ionicons.arrowForward,
            color: AppColor.primary,
            size: 22,
          ),
          onPressed: () => controller.login(),
        ),
      ],
    );
  }
}