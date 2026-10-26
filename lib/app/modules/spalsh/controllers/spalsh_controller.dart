import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/data/local/storage_service.dart';
import 'package:restaurants_app/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final StorageService _storageService = StorageService();

  @override
  void onInit() {
    super.onInit();
    _navigateToNextRoute();
  }

  void _navigateToNextRoute() async {
    await Future.delayed(const Duration(seconds: 2));

    final bool isFirstTime = _storageService.isFirstTime();
    final String? token = _storageService.getToken();
    final int regStep = _storageService.getRegistrationStep();

    if (kDebugMode) {
      print("========== SPLASH DEBUG ==========");
      print("👉 isFirstTime: $isFirstTime");
      print("👉 Token: $token");
      print("👉 Registration Step: $regStep");
      print("==================================");
    }

    // ১. সবার আগে চেক করুন রেজিস্ট্রেশন অসম্পূর্ণ আছে কিনা (Step 1 বা Step 2)
    if (regStep == 1) {
      Get.offAllNamed(Routes.REGISTER_STEP_TWO);
      return;
    } else if (regStep == 2) {
      Get.offAllNamed(Routes.REGISTER_STEP_THREE);
      return;
    }

    // ২. যদি প্রথমবার অ্যাপ ওপেন করে (এবং রেজিস্ট্রেশন বা লগইন না করে থাকে)
    if (isFirstTime) {
      Get.offAllNamed(Routes.WELCOME);
      return;
    }

    // ৩. যদি ইউজার সম্পূর্ণ লগইন করা থাকে (টোকেন থাকে)
    if (token != null && token.isNotEmpty) {
      Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
      return;
    }

    // ৪. অন্যথায় ডিফল্টভাবে Login পেজে পাঠাবে
    Get.offAllNamed(Routes.LOGIN);
  }}