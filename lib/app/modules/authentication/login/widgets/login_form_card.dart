import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_text_from_field.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/core/utils/app_validators.dart';
import 'package:restaurants_app/app/modules/authentication/login/controllers/login_controller.dart';

class LoginFormCard extends StatelessWidget {
  final LoginController controller;
  final ColorScheme colorScheme;
  final Color borderColor;
  final bool isDark;

  const LoginFormCard({
    super.key,
    required this.controller,
    required this.colorScheme,
    required this.borderColor,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.25 : 0.06),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email Field
          CustomTextFromField(
            label: 'Email',
            hint: 'Ex: abc@example.com',
            isRequired: true,
            controller: controller.emailController,
            prefixIcon: const Icon(Ionicons.mail),
            keyboardType: TextInputType.emailAddress,
            validator: AppValidators.validateEmail,
            onChanged: (value) {},
          ),

          SizedBox(height: AppSize.lg),

          // Password Field
          CustomTextFromField(
            label: 'Your Password',
            hint: '••••••••',
            isRequired: true,
            isPassword: true,
            controller: controller.passwordController,
            validator: AppValidators.validatePassword,
            prefixIcon: const Icon(Ionicons.lockClosed),
            keyboardType: TextInputType.visiblePassword,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}