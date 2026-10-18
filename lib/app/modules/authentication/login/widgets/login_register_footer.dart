import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/routes/app_pages.dart';

class LoginRegisterFooter extends StatelessWidget {
  final TextTheme textTheme;
  final ColorScheme colorScheme;

  const LoginRegisterFooter({
    super.key,
    required this.textTheme,
    required this.colorScheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Get.offNamed(Routes.REGISTER);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
            child: Text(
              'Register',
              style: textTheme.bodyMedium?.copyWith(
                color: AppColor.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}