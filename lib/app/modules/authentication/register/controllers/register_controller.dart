import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/common/custom_widgets/custom_toast.dart';
import 'package:restaurants_app/app/data/local/storage_service.dart';
import 'package:restaurants_app/app/data/services/api/auth_services.dart';
import 'package:restaurants_app/app/data/services/file/image/image_picker_service.dart';
import 'package:restaurants_app/app/routes/app_pages.dart';

class RegisterController extends GetxController {

  var isLoading = false.obs;

  final AuthServices _authServices = AuthServices();

  final StorageService _storageService = StorageService();

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final restaurantNameController = TextEditingController();
  final restaurantAddressController = TextEditingController();
  final restaurantDescriptionController = TextEditingController();




  final ImagePickerService _imagePickerService = ImagePickerService();

  // Observables for selected images
  Rx<File?> logoImage = Rx<File?>(null);
  Rx<File?> coverImage = Rx<File?>(null);


  // Pick Logo
  Future<void> pickLogo() async {
    final pickedFile = await _imagePickerService.pickImageBottomSheet();
    if (pickedFile != null) {
      logoImage.value = File(pickedFile.path);
    }
  }

  // Pick Cover Photo
  Future<void> pickCoverPhoto() async {
    final pickedFile = await _imagePickerService.pickImageBottomSheet();
    if (pickedFile != null) {
      coverImage.value = File(pickedFile.path);
    }
  }

  Future<void> registerStep1(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading(true);

      Map<String, String> fields = {
        'name': nameController.text.trim(),
        'phone': phoneController.text.trim(),
        'email': emailController.text.trim(),
        'password': passwordController.text.trim(),
      };

      var response = await _authServices.registerStepOne(fields);

      if (response != null && response['token'] != null) {
        String token = response['token'];

        await _storageService.saveToken(token);

        if (kDebugMode) {
          print("Token Saved Successfully: $token");
        }
      }

      Get.offNamed(Routes.REGISTER_STEP_TWO);

      CustomToast.show(
        context: context,
        message: "Success!",
        type: ToastType.success,
      );
    } catch (e) {
      String errorMessage = e.toString().replaceAll("Exception: ", "");

      if (kDebugMode) print("Registration Error: $e");
      CustomToast.show(
        context: context,
        message: errorMessage,
        type: ToastType.error,
      );
    } finally {
      isLoading(false);
    }
  }


  Future<void> registerStep2(BuildContext context) async {
    if (logoImage.value == null) {
      if (kDebugMode) print("Validation Error: Logo image is missing.");
      CustomToast.show(
        context: context,
        message: "Please upload your restaurant logo",
        type: ToastType.error,
      );
      return;
    }

    if (coverImage.value == null) {
      if (kDebugMode) print("Validation Error: Cover photo is missing.");
      CustomToast.show(
        context: context,
        message: "Please upload your restaurant cover photo",
        type: ToastType.error,
      );
      return;
    }

    try {
      isLoading(true);

      String? token = _storageService.getToken() ?? '';
      if (kDebugMode) print("Step 2 Token: $token");
      if (kDebugMode) print("Logo Path: ${logoImage.value!.path}");
      if (kDebugMode) print("Cover Path: ${coverImage.value!.path}");

      var response = await _authServices.registerStepTwo(
        fields: {

        },
        logoPath: logoImage.value!.path,
        coverPath: coverImage.value!.path,
        token: token,
      );

      if (kDebugMode) print("Step 2 API Response: $response");

      // যেহেতু NetworkApiService সফল হলে সরাসরি জেসন বডি রিটার্ন করে,
      // তাই এখানে response সরাসরি পেয়ে যাবেন (response.statusCode লাগবে না)
      if (response != null) {
        CustomToast.show(
          context: context,
          message: "Restaurant media uploaded successfully!",
          type: ToastType.success,
        );

        Get.offNamed(Routes.REGISTER_STEP_THREE);
      } else {
        if (kDebugMode) print("Step 2 Error: Response is null");
        CustomToast.show(
          context: context,
          message: "Registration Error",
          type: ToastType.error,
        );
      }

    } catch (e) {
      String errorMessage = e.toString().replaceAll("Exception: ", "");

      if (kDebugMode) print("Registration Error Catch: $e");

      CustomToast.show(
        context: context,
        message: "Registration Error: $errorMessage",
        type: ToastType.error,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> registerStep3(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading(true);

      Map<String, String> data = {
        'restaurant_name': restaurantNameController.text.trim(),
        'restaurant_address': restaurantAddressController.text.trim(), // আপনার ফিল্ড অনুযায়ী নাম ঠিক করে নিতে পারেন
        'restaurant_description': restaurantDescriptionController.text.trim(),
      };

      // সেফলি টোকেন রিড করা (নাল হলে এম্টি স্ট্রিং বা হ্যান্ডেল করা)
      String? token = _storageService.getToken();
      if (kDebugMode) print("Step 3 Token: $token");

      if (token == null || token.isEmpty) {
        Get.snackbar(
          "Error",
          "Authentication token not found. Please login again.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      var response = await _authServices.registerStepThree(data, token);

      if (kDebugMode) print("Step 3 API Response: $response");

      // যেহেতু NetworkApiService সফল হলে সরাসরি বডি (json) রিটার্ন করে
      if (response != null) {
        CustomToast.show(
          context: context,
          message: "Registration Successful!",
          type: ToastType.success,
        );

        Get.offNamed(Routes.BOTTOM_NAVIGATION);
      } else {
        CustomToast.show(
          context: context,
          message: "Registration Error",
          type: ToastType.error,
        );
      }

    } catch (e) {
      String errorMessage = e.toString().replaceAll("Exception: ", "");
      if (kDebugMode) print("Registration Error: $e");

      CustomToast.show(
        context: context,
        message: errorMessage,
        type: ToastType.error,
      );
    } finally {
      isLoading(false);
    }
  }







}
