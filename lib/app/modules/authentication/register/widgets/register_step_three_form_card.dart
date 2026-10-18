import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_text_from_field.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/core/utils/app_validators.dart';
import 'package:restaurants_app/app/modules/authentication/register/controllers/register_controller.dart';

class RegisterStepThreeFormCard extends StatelessWidget {
  final RegisterController controller;
  final ColorScheme colorScheme;
  final Color borderColor;
  final bool isDark;

  const RegisterStepThreeFormCard({
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
          // Restaurant Name
          CustomTextFromField(
            controller: controller.restaurantNameController,
            label: 'Restaurant Name',
            hint: 'Ex: Nanna Restaurant',
            isRequired: true,
            prefixIcon: const Icon(Ionicons.restaurant),
            keyboardType: TextInputType.text,
            validator: AppValidators.validateRestaurantName,
          ),

          SizedBox(height: AppSize.lg),

          // Restaurant Address
          CustomTextFromField(
            controller: controller.restaurantAddressController,
            label: 'Restaurant Address',
            hint: 'Ex: Dhaka BD',
            isRequired: true,
            prefixIcon: const Icon(Ionicons.location),
            keyboardType: TextInputType.text,
            validator: AppValidators.validateRestaurantAddress,
          ),

          SizedBox(height: AppSize.lg),

          // Restaurant Description
          CustomTextFromField(
            controller: controller.restaurantDescriptionController,
            label: 'Restaurant Description',
            hint: 'Ex: This is a best restaurant',
            prefixIcon: const Icon(Ionicons.text),
            keyboardType: TextInputType.text,
            isRequired: true,
            validator: AppValidators.validateRestaurantDescription,
          ),
        ],
      ),
    );
  }
}