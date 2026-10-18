import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/core/app_config/app_config.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_footer_widget.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_form_card.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_header_widget.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_reveal.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/welcome_background.dart';

import '../../../../core/constants/app_size..dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final borderColor = isDark ? AppColor.darkBorder : AppColor.border;
    final screenHeight = MediaQuery.of(context).size.height;

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
            // Welcome ar Login page er moto same background
            WelcomeBackground(isDark: isDark),

            SafeArea(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                    padding: EdgeInsets.all(AppSize.xl),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          RegisterReveal(
                            begin: 0.0,
                            child: RegisterHeaderWidget(
                              maxHeight: screenHeight,
                              title: 'Create Account',
                              subTitle1: 'Create an ',
                              subTitle2: 'account',
                              subTitle3:
                              ' to access all the features of ${AppConfig.appName}!',
                            ),
                          ),

                          SizedBox(height: AppSize.xl),

                          // Form card
                          RegisterReveal(
                            begin: 0.2,
                            child: RegisterFormCard(
                              controller: controller,
                              colorScheme: colorScheme,
                              borderColor: borderColor,
                              isDark: isDark,
                            ),
                          ),

                          SizedBox(height: AppSize.xl),

                          // Continue button
                          RegisterReveal(
                            begin: 0.35,
                            child: Obx(() {
                              return CustomButton(
                                text: 'Continue',
                                isLoading: controller.isLoading.value,
                                onPressed: () {
                                  controller.registerStep1(context);
                                },
                              );
                            }),
                          ),

                          const SizedBox(height: 24),

                          RegisterReveal(
                            begin: 0.5,
                            child: const RegisterFooterWidget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}