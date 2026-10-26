import 'package:get/get.dart';

import '../controllers/spalsh_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
