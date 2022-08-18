import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageOneController extends GetxController {
  //TODO: Implement ImageOneController

  final count = 0.obs;
  final imagePick = Rxn<XFile?>();

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

  getCamera() {
    openDialog();
  }

  void openDialog() {
    AlertDialog alert = AlertDialog(

      title: Text("Select Image".tr),
      content: Text("Choose video from the options below".tr),
      actions: [
        TextButton(
          onPressed: () {
            imagePic(ImageSource.camera);
            Get.back();
          },
          child: Text("CAMERA".tr),
        ),
        TextButton(
          onPressed: () {
            imagePic(ImageSource.gallery);
            Get.back();
          },
          child: Text("GALLERY".tr),
        ),
      ],
    );
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  imagePic(ImageSource imageSource) async {
    imagePick.value = await ImagePicker().pickVideo(source: imageSource);
  }



  void uploadImage() {
    final path="file/${imagePick.value!.name}";
    final file=File(imagePick.value!.path);

    final res=FirebaseStorage.instance.ref().child(path);
    res.putFile(file);
    //print("path:::::${file}");
  }


}
