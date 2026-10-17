import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_toast.dart';
import 'package:restaurants_app/app/routes/app_pages.dart';

import '../../../../data/local/storage_service.dart';
import '../../../../data/services/api/auth_services.dart';

class LoginController extends GetxController {



  var isLoading = false.obs;

  final AuthServices _authServices = AuthServices();

  final StorageService _storageService = StorageService();

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading(true);

      Map<String, String> data = {
        'email': emailController.text.trim(), // যদি ব্যাকএন্ডে ফোন দিয়ে লগিন হয়, তবে 'phone' দেবেন
        'password': passwordController.text.trim(),
      };

      var response = await _authServices.loginApi(data);

      if (kDebugMode) print("Login API Response: $response");

      // যেহেতু response সরাসরি একটি Map (যেমন: {"token": "...", "restaurant_user": {...}})
      if (response != null && response['token'] != null) {
        String token = response['token'];

        // লোকাল স্টোরেজে টোকেন সেভ করা
        await _storageService.saveToken(token);
        if (kDebugMode) print("Token Saved Successfully: $token");

        CustomToast.show(
          context: context,
          message: "Login Successful!",
          type: ToastType.success,
        );

        Get.offAllNamed(Routes.BOTTOM_NAVIGATION);
      } else {
        CustomToast.show(
          context: context,
          message: "Login Error: Token not found",
          type: ToastType.error,
        );
      }

    } catch (e) {
      String errorMessage = e.toString().replaceAll("Exception: ", "");
      if (kDebugMode) print("Login Error Catch: $e");

      CustomToast.show(
        context: context,
        message: "Login Error: $errorMessage",
        type: ToastType.error,
      );
    } finally {
      isLoading(false);
    }
  }

}
