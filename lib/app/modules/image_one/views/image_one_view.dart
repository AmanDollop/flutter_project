import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/image_one_controller.dart';

class ImageOneView extends GetView<ImageOneController> {
  const ImageOneView({Key? key}) : super(key: key);
  ImageProvider showProfilePic() {
    if (controller.imagePick.value != null) {
      return FileImage(File(controller.imagePick.value!.path));
    }
    return const AssetImage("Images/indiaflag.webp");
  }
  @override
  Widget build(BuildContext context) {
    return  Obx(() => Scaffold(
        appBar: AppBar(
          title: const Text('ImageUploadView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 125,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.red,
                            width: 5),
                        image: DecorationImage(
                          image: showProfilePic(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: InkWell(
                      onTap: () => controller.getCamera(),
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: controller.uploadImage,
              child: Text('Upload video in firebase'),
            ),
          ],
        ),
      ),
    );
  }
}


