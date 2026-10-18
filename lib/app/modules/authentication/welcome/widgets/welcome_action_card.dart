import 'package:flutter/material.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/controllers/welcome_controller.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/action_button.dart';

class WelcomeActionCard extends StatelessWidget {
  final TextTheme textTheme;
  final bool isDark;
  final ColorScheme colorScheme;
  final WelcomeController controller;

  const WelcomeActionCard({
    super.key,
    required this.textTheme,
    required this.isDark,
    required this.colorScheme,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? AppColor.darkBorder : AppColor.border,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.25 : 0.06),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ActionButton(
        textTheme: textTheme,
        isDark: isDark,
        colorScheme: colorScheme,
        controller: controller,
      ),
    );
  }
}