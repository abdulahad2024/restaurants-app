import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_text_from_field.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/core/utils/app_validators.dart';
import 'package:restaurants_app/app/modules/authentication/register/controllers/register_controller.dart';

class RegisterFormCard extends StatelessWidget {
  final RegisterController controller;
  final ColorScheme colorScheme;
  final Color borderColor;
  final bool isDark;

  const RegisterFormCard({
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
          // Name Field
          CustomTextFromField(
            label: 'Your Name',
            hint: 'Ex: Abdul Rakip',
            controller: controller.nameController,
            isRequired: true,
            prefixIcon: const Icon(Ionicons.person),
            keyboardType: TextInputType.text,
            validator: AppValidators.validateName,
          ),

          SizedBox(height: AppSize.lg),

          // Phone Field
          CustomTextFromField(
            label: 'Your Phone',
            hint: 'Ex: +8801711111111',
            controller: controller.phoneController,
            isRequired: true,
            prefixIcon: const Icon(Ionicons.call),
            keyboardType: TextInputType.phone,
            validator: AppValidators.validatePhone,
          ),

          SizedBox(height: AppSize.lg),

          // Email Field
          CustomTextFromField(
            label: 'Email',
            hint: 'Ex: abc@gmail.com',
            controller: controller.emailController,
            prefixIcon: const Icon(Ionicons.mail),
            keyboardType: TextInputType.emailAddress,
            isRequired: true,
            validator: AppValidators.validateEmail,
          ),

          SizedBox(height: AppSize.lg),

          // Password Field
          CustomTextFromField(
            label: 'Your Password',
            hint: '••••••••',
            isRequired: true,
            controller: controller.passwordController,
            isPassword: true,
            prefixIcon: const Icon(Ionicons.lockClosed),
            keyboardType: TextInputType.visiblePassword,
            validator: AppValidators.validatePassword,
          ),
        ],
      ),
    );
  }
}