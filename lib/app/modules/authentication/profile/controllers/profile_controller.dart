import 'package:get/get.dart';
import 'package:restaurants_app/app/data/local/storage_service.dart';
import 'package:restaurants_app/app/data/models/auth/restaurant_user_model.dart';
import 'package:restaurants_app/app/data/services/api/auth_services.dart';
import 'package:restaurants_app/app/routes/app_pages.dart';
// আপনার এপিআই সার্ভিস ইমপোর্ট করুন (যেমন: ApiService বা ApiProvider)
// import 'package:restaurants_app/app/data/providers/api_service.dart';

class ProfileController extends GetxController {
  // এপিআই সার্ভিসের ইন্সট্যান্স (আপনার প্রজেক্ট অনুযায়ী ক্লাস নাম দিয়ে দিন)
  // final ApiService _apiService = ApiService();

  final StorageService _storageService = StorageService();
  final AuthServices apiService = AuthServices();

  var isLoading = false.obs;
  var userProfile = Rxn<RestaurantUserModel>();

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  void fetchUserProfile() async {
    try {
      isLoading.value = true;
      final token = _storageService.getToken();

      if (token == null || token.isEmpty) {
        // টোকেন না থাকলে লগইন পেজে রিডাইরেক্ট করে দিতে পারেন
        Get.offAllNamed(Routes.LOGIN);
        return;
      }

      // 🟢 এপিআই কল (আপনার এপিআই মেথড অনুযায়ী পরিবর্তন করতে পারেন)
      dynamic response = await apiService.getUserProfile(token);
      //
      // ডেমো বা রিয়েল রেসপন্স হ্যান্ডেলিং:
      // যদি রেসপন্স সরাসরি Map আকারে আসে:
      if (response != null && response['restaurant_user'] != null) {
        userProfile.value = RestaurantUserModel.fromJson(response['restaurant_user']);
      }

      /*
        ⚠️ যদি আপনার _apiService.getUserProfile সরাসরি Map রিটার্ন না করে
        HttpResponse বা অন্য কিছু রিটার্ন করে, তবে রেসপন্স স্ট্রাকচার অনুযায়ী
        নিচের মতো ডেটা পার্স করে নেবেন:
      */

    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load profile: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // প্রফাইল রিফ্রেশ করার জন্য পুল-টু-রিফ্রেশ মেথড
  Future<void> refreshProfile() async {
    fetchUserProfile();
  }
}