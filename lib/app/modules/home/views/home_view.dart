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
      appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(AppSize.xl),
        child: SafeArea(
          child: Column(
            children: [
              CustomTextFromField(
                label: 'Full Name',
                hint: 'Enter your name',
                isRequired: true,
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: AppSize.lg),

              CustomTextFromField(
                label: 'Email Address',
                hint: 'Enter your email address',
                isRequired: true,
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: AppSize.lg),

              CustomTextFromField(
                label: 'Password',
                hint: 'Enter your password',
                isRequired: true,
                isPassword: true,
                onChanged: (value) {
                  print(value);
                },
              ),

              SizedBox(height: AppSize.xl),

              CustomButton(
                text: 'Register',
                onPressed: () {
                  // ১. সাকসেস ডায়ালগ
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
              SizedBox(height: AppSize.xl),

              CustomButton(
                backgroundColor: Colors.red,
                text: 'Toast',
                onPressed: () {
                  CustomToast.show(
                    context: context,
                    message: 'সতর্কতা! পাসওয়ার্ডটি খুব সহজ হয়ে গেছে।',
                    type: ToastType.success,

                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
