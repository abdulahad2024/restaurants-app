import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_header_widget.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_step_three_form_card.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_step_three_reveal.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/welcome_background.dart';

import '../../../../core/constants/app_size..dart';

class RegisterStepThreeView extends GetView<RegisterController> {
  const RegisterStepThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final borderColor = isDark ? AppColor.darkBorder : AppColor.border;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor:
        isDark ? AppColor.darkScaffold : AppColor.scaffold,
        systemNavigationBarIconBrightness:
        isDark ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            // Background
            WelcomeBackground(isDark: isDark),

            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 480,
                          minHeight: constraints.maxHeight,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(AppSize.xl),
                          child: IntrinsicHeight(
                            child: Form(
                              key: controller.formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Header
                                  RegisterStepThreeReveal(
                                    begin: 0.0,
                                    child: RegisterHeaderWidget(
                                      maxHeight: constraints.maxHeight,
                                      title: 'Restaurant Info',
                                      subTitle1: 'Provide your ',
                                      subTitle2: 'restaurant details',
                                      subTitle3:
                                      ' to complete the setup process.',
                                    ),
                                  ),

                                  SizedBox(height: AppSize.xl),

                                  // Form card
                                  RegisterStepThreeReveal(
                                    begin: 0.2,
                                    child: RegisterStepThreeFormCard(
                                      controller: controller,
                                      colorScheme: colorScheme,
                                      borderColor: borderColor,
                                      isDark: isDark,
                                    ),
                                  ),

                                  // Spacer to align submit button at bottom
                                  const Spacer(),
                                  SizedBox(height: AppSize.xl),

                                  // Submit button
                                  RegisterStepThreeReveal(
                                    begin: 0.4,
                                    child: Obx(() {
                                      return CustomButton(
                                        text: 'Submit',
                                        isLoading: controller.isLoading.value,
                                        onPressed: () {
                                          controller.registerStep3(context);
                                        },
                                      );
                                    }),
                                  ),

                                  SizedBox(height: AppSize.sm),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}