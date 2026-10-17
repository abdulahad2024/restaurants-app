import 'package:flutter/foundation.dart';
import 'package:restaurants_app/app/core/app_config/api_url.dart';
import 'package:restaurants_app/app/data/network/network_api_service.dart';

class AuthServices {

  final NetworkApiService _apiService = NetworkApiService();

  // --- 1. Login API ---
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApi(ApiUrl.login, data);
      return response;
    } catch (e) {
      if (kDebugMode) print("Login Error: $e");
      rethrow;
    }
  }

  // --- 2. Register API ---
  Future<dynamic> registerStepOne(dynamic data) async {
    try {
      dynamic response = await _apiService.postApi(ApiUrl.registerStepOne, data);
      return response;
    } catch (e) {
      if (kDebugMode) print("Register Error: $e");
      rethrow;
    }
  }

// --- 2. Register Step Two (Logo & Cover Upload) ---
  Future<dynamic> registerStepTwo({
    required Map<String, String> fields,
    required String logoPath,
    required String coverPath,
    required String token,
  }) async {
    try {
      dynamic response = await _apiService.multipartApi(
        ApiUrl.registerStepTwo,
        fields: fields,
        files: {
          'restaurant_logo': logoPath,         // আপনার ব্যাকএন্ডের লোগো ফিল্ড নেম
          'cover_image': coverPath, // আপনার ব্যাকএন্ডের কভার ফটো ফিল্ড নেম
        },
        token: token,
      );
      return response;
    } catch (e) {
      if (kDebugMode) print("Register Step Two Error: $e");
      rethrow;
    }
  }


  Future<dynamic> registerStepThree(dynamic data,String token) async {
    try {
      dynamic response = await _apiService.postApi(ApiUrl.registerStepThree, data,token: token);
      return response;
    } catch (e) {
      if (kDebugMode) print("Register Error: $e");
      rethrow;
    }
  }


  // --- 3. Logout API ---
  Future<dynamic> logoutApi(String token) async {
    try {
      dynamic response = await _apiService.postApi(ApiUrl.logout, {}, token: token);
      return response;
    } catch (e) {
      if (kDebugMode) print("Logout Error: $e");
      rethrow;
    }
  }

  // --- 4. Get User Profile API ---
  Future<dynamic> getUserProfile(String token) async {
    try {
      dynamic response = await _apiService.getApi(ApiUrl.profile, token: token);
      return response;
    } catch (e) {
      if (kDebugMode) print("Profile Fetch Error: $e");
      rethrow;
    }
  }


  // --- 6. Forgot Password API ---
  Future<dynamic> forgotPasswordApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApi(ApiUrl.forgotPassword, data);
      return response;
    } catch (e) {
      if (kDebugMode) print("Forgot Password Error: $e");
      rethrow;
    }
  }
}