import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_dialog.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_text_from_field.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios, size: 24),
                      ),

                      SizedBox(height: constraints.maxHeight * 0.02),

                      const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5B45FF),
                        ),
                      ),

                      SizedBox(height: AppSize.sm),

                      RichText(
                        text: const TextSpan(
                          text: 'Create an ',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.primary,
                          ),
                          children: [
                            TextSpan(
                              text: 'account',
                              style: TextStyle(
                                color: AppColor.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' to access all the features of Maxpense!',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: AppSize.xl),
                      CustomTextFromField(
                        label: 'Your Name',
                        hint: 'Ex: Abdul Rakip',
                        isRequired: true,
                        prefixIcon:  Icon(Ionicons.person),
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          print(value);
                        },
                      ),

                      SizedBox(height: AppSize.lg),

                      CustomTextFromField(
                        label: 'Your Phone',
                        hint: 'Ex: +8801711111111',
                        isRequired: true,
                        prefixIcon:  Icon(Ionicons.call),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          print(value);
                        },
                      ),

                      SizedBox(height: AppSize.lg),

                      CustomTextFromField(
                        label: 'Email',
                        hint: 'Ex: abc@gmail.com',
                        prefixIcon:  Icon(Ionicons.mail),
                        keyboardType: TextInputType.emailAddress,
                        isRequired: true,
                        onChanged: (value) {
                          print(value);
                        },
                      ),

                      SizedBox(height: AppSize.lg),

                      CustomTextFromField(
                        label: 'Restaurants Name',
                        hint: 'Ex: Chill House',
                        prefixIcon:  Icon(Ionicons.storefront),
                        keyboardType: TextInputType.emailAddress,
                        isRequired: true,
                        onChanged: (value) {
                          print(value);
                        },
                      ),

                      SizedBox(height: AppSize.lg),



                      CustomTextFromField(
                        label: 'Your Password',
                        hint: '••••••••',
                        isRequired: true,
                        isPassword: true,
                        prefixIcon:  Icon(Ionicons.lockClosed),
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {
                          print(value);
                        },
                      ),

                      SizedBox(height: AppSize.xl * 1.5),

                      CustomButton(
                        text: 'Register',
                        onPressed: () {
                          CustomDialog.show(
                            context: context,
                            title: 'confirmation!',
                            message: 'Register Success',
                            type: DialogType.confirmation,
                            onConfirm: () {
                              // অ্যাকশন
                            },
                          );
                        },
                      ),

                      SizedBox(height: AppSize.lg),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.LOGIN);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xFF5B45FF),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
