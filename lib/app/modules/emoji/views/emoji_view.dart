import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/app/modules/emoji/controllers/emoji_controller.dart';
import 'package:get/get.dart';

class EmojiPickerView extends GetView<EmojiController> {
  const EmojiPickerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Emoji Picker Example App'),
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          Container(
              height: 66.0,
              color: Colors.blue,
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {
                        print('controller.emojiShowing.value${controller.emojiShowing.value}');
                        controller.emojiShowing.value = !controller.emojiShowing.value;
                        print('controller.emojiShowing.value${controller.emojiShowing.value}');
                      },
                      icon: const Icon(
                        Icons.emoji_emotions,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                          controller: controller.cont,
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.black87),
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                left: 16.0,
                                bottom: 8.0,
                                top: 8.0,
                                right: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          )),
                    ),
                  ),
                  SizedBox(width: 10,),
                ],
              )),
          Offstage(
            offstage: !controller.emojiShowing.value,
            child: SizedBox(
              height: 250,
              child: EmojiPicker(
                  textEditingController: controller.cont,
                  onEmojiSelected: (Category category, Emoji emoji) {
                  },
                  config: Config(
                      columns: 7,
                      // Issue: https://github.com/flutter/flutter/issues/28894
                      emojiSizeMax: 22 * (Platform.isAndroid ? 1.30 : 1.0),
                      verticalSpacing: 0,
                      horizontalSpacing: 0,
                      gridPadding: EdgeInsets.zero,
                      initCategory: Category.RECENT,
                      bgColor: const Color(0xFFF2F2F2),
                      indicatorColor: Colors.blue,
                      iconColor: Colors.grey,
                      iconColorSelected: Colors.blue,
                      progressIndicatorColor: Colors.blue,
                      backspaceColor: Colors.blue,
                      skinToneDialogBgColor: Colors.white,
                      skinToneIndicatorColor: Colors.grey,
                      enableSkinTones: true,
                      showRecentsTab: true,
                      recentsLimit: 28,
                      replaceEmojiOnLimitExceed: false,
                      noRecents: const Text(
                        'No Recents',
                        style: TextStyle(fontSize: 20, color: Colors.black26),
                        textAlign: TextAlign.center,
                      ),
                      tabIndicatorAnimDuration: kTabScrollDuration,
                      categoryIcons: const CategoryIcons(),
                      buttonMode: ButtonMode.MATERIAL)),
            ),
          ),
        ],
      ),
    ));
      /*Scaffold(
        appBar: AppBar(
          title: Text("Image Upload"),
        ),
        body: Image(
          image: FirebaseImage('Images/indiaflag.webp',
              shouldCache: true, // The image should be cached (default: True)
              //  maxSizeBytes: 3000 * 1000, // 3MB max file size (default: 2.5MB)
              cacheRefreshStrategy:
              CacheRefreshStrategy.NEVER // Switch off update checking
          ),
          height: 300,
          width: 100,
        ),
      );*/
  }
}



