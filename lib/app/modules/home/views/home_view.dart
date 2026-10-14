import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_button.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_dialog.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_text_from_field.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_toast.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(AppSize.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ব্যাক বাটন
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back, size: 24),
              ),

              SizedBox(height: AppSize.lg),

              // বড় হেডিং ("Register")
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF5B45FF), // ছবির সাথে মিল রেখে নীল রঙ
                ),
              ),

              SizedBox(height: AppSize.sm),

              // সাবটাইটেল
              RichText(
                text: const TextSpan(
                  text: 'Create an ',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  children: [
                    TextSpan(
                      text: 'account',
                      style: TextStyle(color: Color(0xFF5B45FF), fontWeight: FontWeight.w500),
                    ),
                    TextSpan(
                      text: ' to access all the features of Maxpense!',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              SizedBox(height: AppSize.xl),

              // ১. Email Address ফিল্ড (ডিজাইন অনুযায়ী সবার উপরে)
              CustomTextFromField(
                label: 'Email',
                hint: 'Ex: abc@example.com',
                isRequired: true,
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: AppSize.lg),

              // ২. Your Name ফিল্ড
              CustomTextFromField(
                label: 'Your Name',
                hint: 'Ex: Saul Ramirez',
                isRequired: true,
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: AppSize.lg),

              // ৩. Your Password ফিল্ড
              CustomTextFromField(
                label: 'Your Password',
                hint: '••••••••',
                isRequired: true,
                isPassword: true,
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: AppSize.xl * 1.5),

              // Register বাটন
              CustomButton(
                text: 'Register',
                onPressed: () {
                  // সাকসেস ডায়ালগ
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


              // নিচের "Already have an account? Login" অংশ
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Login পেজে যাওয়ার রাউট এখানে দিন
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
  }
}