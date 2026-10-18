import 'package:get/get.dart';

import '../controllers/add_foods_controller.dart';

class AddFoodsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddFoodsController>(
      () => AddFoodsController(),
    );
  }
}
