import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_text_from_field.dart';
import 'package:restaurants_app/app/core/app_config/app_config.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/core/utils/app_validators.dart';
import 'package:restaurants_app/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_footer_widget.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_header_widget.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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
                          title: 'Create Account',
                          subTitle1: 'Create an ',
                          subTitle2: 'account',
                          subTitle3: ' to access all the features of ${AppConfig.appName}!',
                        ),
                        SizedBox(height: AppSize.xl),

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

                        SizedBox(height: AppSize.xl * 1.5),

                        Obx(() {
                          return CustomButton(
                            text: 'Continue',
                            isLoading: controller.isLoading.value,
                            onPressed: () {
                              controller.registerStep1(context);
                            },
                          );
                        }),

                        SizedBox(height: AppSize.lg),

                        const RegisterFooterWidget(),
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