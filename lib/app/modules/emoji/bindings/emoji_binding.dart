import 'package:get/get.dart';

import '../controllers/emoji_controller.dart';

class EmojiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmojiController>(
      () => EmojiController(),
    );
  }
}
