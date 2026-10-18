import 'package:get/get.dart';
import 'package:restaurants_app/app/routes/app_pages.dart';

class WelcomeController extends GetxController {


  Future<void> register() async {
    Get.toNamed(Routes.REGISTER);
  }

  void login() {
    Get.toNamed(Routes.LOGIN);
  }


}