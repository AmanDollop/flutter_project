import 'package:get/get.dart';

import '../controllers/image_one_controller.dart';

class ImageOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImageOneController>(
      () => ImageOneController(),
    );
  }
}
