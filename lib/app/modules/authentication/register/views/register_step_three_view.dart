import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_text_from_field.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/core/utils/app_validators.dart';
import 'package:restaurants_app/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_header_widget.dart';

class RegisterStepThreeView extends GetView<RegisterController> {
  const RegisterStepThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(AppSize.xl),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RegisterHeaderWidget(
                          maxHeight: constraints.maxHeight,
                          title: 'Restaurant Info',
                          subTitle1: '',
                          subTitle2: '',
                          subTitle3: '',
                        ),

                        SizedBox(height: AppSize.xl),

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

                        CustomTextFromField(
                          controller:
                              controller.restaurantDescriptionController,
                          label: 'Restaurant Description',
                          hint: 'Ex: This is a best restaurant',
                          prefixIcon: const Icon(Ionicons.text),
                          keyboardType: TextInputType.text,
                          isRequired: true,
                          validator:
                              AppValidators.validateRestaurantDescription,
                        ),

                        SizedBox(height: AppSize.xl * 1.5),

                        Obx(() {
                          return CustomButton(
                            text: 'Submit',
                            isLoading: controller.isLoading.value,
                            onPressed: () {
                              controller.registerStep3(context);
                            },
                          );
                        }),

                        SizedBox(height: AppSize.lg),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
