import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_dialog.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_text_from_field.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

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
                  // বড় স্ক্রিন বা ট্যাবলেটে অতিরিক্ত চওড়া হওয়া রোধ করতে ম্যাক্স উইথ সেট করা হলো
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ব্যাক বাটন
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios, size: 24),
                      ),

                      SizedBox(height: constraints.maxHeight * 0.02),

                      // বড় হেডিং ("Login")
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5B45FF), // থিম কালার
                        ),
                      ),

                      SizedBox(height: AppSize.sm),

                      // সাবটাইটেল
                      RichText(
                        text: const TextSpan(
                          text: 'Welcome back! Please enter your ',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                          children: [
                            TextSpan(
                              text: 'details',
                              style: TextStyle(
                                color: Color(0xFF5B45FF),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' to sign in.',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: AppSize.xl),

                      // ১. Email Address ফিল্ড
                      CustomTextFromField(
                        label: 'Email',
                        hint: 'Ex: abc@example.com',
                        isRequired: true,
                        prefixIcon:  Icon(Ionicons.mail),
                        keyboardType: TextInputType.emailAddress,
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

                      // Login বাটন
                      CustomButton(
                        text: 'Login',
                        onPressed: () {
                          // সাকসেস ডায়ালগ বা লগইন লজিক
                          CustomDialog.show(
                            context: context,
                            title: 'confirmation!',
                            message: 'Login Success',
                            type: DialogType.confirmation,
                            onConfirm: () {
                              // অ্যাকশন
                            },
                          );
                        },
                      ),

                      SizedBox(height: AppSize.lg),

                      // নিচের "Don’t have an account? Register" অংশ
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don’t have an account? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offNamed(Routes.REGISTER);
                            },
                            child: const Text(
                              'Register',
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