import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/modules/authentication/register/controllers/register_controller.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/register_footer_widget.dart';
import 'package:restaurants_app/app/modules/authentication/register/widgets/restaurant_media_picker_widget.dart';

import '../widgets/register_header_widget.dart';

class RegisterStepTwoView extends GetView<RegisterController> {
  const RegisterStepTwoView({super.key});

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
                          title: 'Restaurant Media',
                          subTitle1: 'Please upload your ',
                          subTitle2: "restaurant's logo and cover",
                          subTitle3: ' photo to complete your profile.',
                        ),

                        SizedBox(height: AppSize.xl),

                        Obx(
                          () => RestaurantMediaPickerWidget(
                            title: 'Restaurant Logo',
                            subtitle:
                                'Square format recommended (e.g. 500x500px)',
                            selectedImage: controller.logoImage.value,
                            onTap: controller.pickLogo,
                            isCover: false,
                          ),
                        ),

                        SizedBox(height: AppSize.lg),

                        Obx(
                          () => RestaurantMediaPickerWidget(
                            title: 'Cover Photo',
                            subtitle:
                                'Wide format recommended (e.g. 1200x600px)',
                            selectedImage: controller.coverImage.value,
                            onTap: controller.pickCoverPhoto,
                            isCover: true,
                          ),
                        ),

                        SizedBox(height: AppSize.xl * 1.5),

                        Obx(() {
                          return CustomButton(
                            text: 'Upload',
                            isLoading: controller.isLoading.value,
                            onPressed: () {
                              controller.registerStep2(context);
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
