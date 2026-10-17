import 'package:restaurants_app/app/core/app_config/app_config.dart';

class ApiUrl {
  static String baseUrl = "${AppConfig.baseUrl}/api/v1/restaurant/";

  // লকাল সার্ভারের জন্য imageBaseUrl এভাবে দিতে পারেন:
  static String get imageBaseUrl => "${AppConfig.baseUrl}/storage/";

  // --- Auth Endpoints (Multi-Step) ---
  static const String registerStepOne = "register/step-1";
  static const String registerStepTwo = "register/step-2";
  static const String registerStepThree = "register/step-3";
  static const String login = "login";
  static const String profile = "user/profile";

  // --- 1. Auth / Authentication Endpoints ---
  static const String register = "register"; // এটি ব্যবহার না করে ওপরের step-1 ব্যবহার করবেন
  static const String logout = "logout";
  static const String forgotPassword = "forgot-password";
  static const String resetPassword = "reset-password";
  static const String updateProfile = "user/profile/update";

  // --- 2. Product Endpoints ---
  static const String getProducts = "products";
  static const String productDetails = "product/details/";
  static const String searchProducts = "products/search";
  static const String categories = "categories";

  // --- 3. Cart & Order Endpoints ---
  static const String getCart = "cart";
  static const String addToCart = "cart/add";
  static const String removeFromCart = "cart/remove/";
  static const String placeOrder = "orders/create";
  static const String orderHistory = "orders/history";

  static String dynamicEndpoint(String endpoint, String id) {
    return "$endpoint/$id";
  }
} // <-- অতিরিক্ত ব্র্যাকেটটি এখানে রিমুভ করা হয়েছে