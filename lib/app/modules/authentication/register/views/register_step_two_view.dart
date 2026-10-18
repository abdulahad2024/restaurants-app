import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_step_two_reveal.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/restaurant_media_picker_widget.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/welcome_background.dart';

import '../widgets/register_header_widget.dart';

class RegisterStepTwoView extends GetView<RegisterController> {
  const RegisterStepTwoView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
            // Onno auth page er moto same background
            WelcomeBackground(isDark: isDark),

            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
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
                                  RegisterStepTwoReveal(
                                    begin: 0.0,
                                    child: RegisterHeaderWidget(
                                      maxHeight: constraints.maxHeight,
                                      title: 'Restaurant Media',
                                      subTitle1: 'Please upload your ',
                                      subTitle2:
                                      "restaurant's logo and cover",
                                      subTitle3:
                                      ' photo to complete your profile.',
                                    ),
                                  ),

                                  SizedBox(height: AppSize.xl),

                                  // Logo picker
                                  RegisterStepTwoReveal(
                                    begin: 0.2,
                                    child: Obx(
                                          () => RestaurantMediaPickerWidget(
                                        title: 'Restaurant Logo',
                                        subtitle:
                                        'Square format recommended (e.g. 500x500px)',
                                        selectedImage:
                                        controller.logoImage.value,
                                        onTap: controller.pickLogo,
                                        isCover: false,
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: AppSize.lg),

                                  // Cover picker
                                  RegisterStepTwoReveal(
                                    begin: 0.35,
                                    child: Obx(
                                          () => RestaurantMediaPickerWidget(
                                        title: 'Cover Photo',
                                        subtitle:
                                        'Wide format recommended (e.g. 1200x600px)',
                                        selectedImage:
                                        controller.coverImage.value,
                                        onTap: controller.pickCoverPhoto,
                                        isCover: true,
                                      ),
                                    ),
                                  ),

                                  // Faka jayga: button ta niche pin kore
                                  const Spacer(),
                                  SizedBox(height: AppSize.xl),

                                  // Upload button
                                  RegisterStepTwoReveal(
                                    begin: 0.5,
                                    child: Obx(() {
                                      return CustomButton(
                                        text: 'Upload',
                                        isLoading: controller.isLoading.value,
                                        onPressed: () {
                                          controller.registerStep2(context);
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