import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmojiController extends GetxController {
  //TODO: Implement EmojiController
  final count = 0.obs;
  final TextEditingController cont = TextEditingController();
  final emojiShowing = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
