import 'package:get/get_utils/src/get_utils/get_utils.dart';

class AppValidators {


  // নামের ভ্যালিডেশন
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your name';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  // ফোনের ভ্যালিডেশন
  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }
    if (!GetUtils.isPhoneNumber(value.trim()) && value.trim().length < 10) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  // ইমেইলের ভ্যালিডেশন
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    if (!GetUtils.isEmail(value.trim())) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // পাসওয়ার্ডের ভ্যালিডেশন
  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }



  static String? validateRestaurantName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your restaurant name';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters long';
    }
    return null;
  }

  static String? validateRestaurantAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your restaurant address';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 5 characters long';
    }
    return null;
  }

  static String? validateRestaurantDescription(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your restaurant description';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 5 characters long';
    }
    return null;
  }












}