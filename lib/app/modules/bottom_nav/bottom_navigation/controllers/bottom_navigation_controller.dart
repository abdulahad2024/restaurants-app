import 'package:get/get.dart';
import 'package:restaurants_app/app/routes/app_pages.dart';

class BottomNavigationController extends GetxController {
  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  void onCenterButtonPressed() {

    Get.toNamed(Routes.ADD_FOODS);

  }
}