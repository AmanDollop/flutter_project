import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_project/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../controllers/imageupload_controller.dart';

class ImageuploadView extends GetView<ImageuploadController> {
  const ImageuploadView({Key? key}) : super(key: key);

  ImageProvider showProfilePic() {
    if (controller.imagePick.value != null) {
      return FileImage(File(controller.imagePick.value!.path));
    }
    return const AssetImage("Images/indiaflag.webp");
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
                  Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 1),
                      image: DecorationImage(
                        image: showProfilePic(),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.getCamera(),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: controller.uploadImage,
              child: Text('UploadImage'),
            ),  ElevatedButton(
              onPressed: (){
                Get.toNamed(Routes.IMAGE_ONE);
              },
              child: Text('Go to next page'),
            ),
          ],
        ),
      ),
    );
  }
}
