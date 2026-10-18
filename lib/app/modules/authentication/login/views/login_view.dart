import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/modules/authentication/login/widgets/login_back_button.dart';
import 'package:restaurants_app/app/modules/authentication/login/widgets/login_form_card.dart';
import 'package:restaurants_app/app/modules/authentication/login/widgets/login_header_section.dart';
import 'package:restaurants_app/app/modules/authentication/login/widgets/login_register_footer.dart';
import 'package:restaurants_app/app/modules/authentication/login/widgets/login_reveal.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/welcome_background.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
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
                                  // Back button
                                  LoginBackButton(
                                    colorScheme: colorScheme,
                                    borderColor: borderColor,
                                  ),

                                  SizedBox(
                                    height: constraints.maxHeight * 0.04,
                                  ),

                                  // Header
                                  LoginReveal(
                                    begin: 0.0,
                                    child: LoginHeaderSection(
                                      textTheme: textTheme,
                                      colorScheme: colorScheme,
                                    ),
                                  ),

                                  SizedBox(height: AppSize.xl),

                                  // Form card
                                  LoginReveal(
                                    begin: 0.2,
                                    child: LoginFormCard(
                                      controller: controller,
                                      colorScheme: colorScheme,
                                      borderColor: borderColor,
                                      isDark: isDark,
                                    ),
                                  ),

                                  SizedBox(height: AppSize.xl),

                                  // Login button
                                  LoginReveal(
                                    begin: 0.35,
                                    child: Obx(() {
                                      return CustomButton(
                                        text: 'Login',
                                        isLoading: controller.isLoading.value,
                                        onPressed: () {
                                          controller.login(context);
                                        },
                                      );
                                    }),
                                  ),

                                  // Spacer to align footer at the bottom
                                  const Spacer(),
                                  const SizedBox(height: 24),

                                  // Register footer
                                  LoginReveal(
                                    begin: 0.5,
                                    child: LoginRegisterFooter(
                                      textTheme: textTheme,
                                      colorScheme: colorScheme,
                                    ),
                                  ),
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