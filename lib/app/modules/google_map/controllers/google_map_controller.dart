import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapControler extends GetxController {
  //TODO: Implement GoogleMapController

  final count = 0.obs;
  final markers = <Marker>[].obs;

  @override
  void onInit() {
    super.onInit();
    addMarker();
  }

  addMarker() async {
    final bitmapIcon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(48,48)), 'Images/indiaflag.webp');
    final Uint8List? markerIcon = await getBytesFromAsset('Images/indiaflag.webp', 100);
    markers.add(
      Marker(
        markerId: MarkerId("Union Bank of India"),
        draggable: true,
        position: const LatLng(22.689939, 75.864195),
        onDragEnd: (LatLng latlang) => {
          print("On DragEnd:- ${latlang}"),
        },
        icon: BitmapDescriptor.fromBytes(markerIcon!),
      ),
    );
    print("Marker:: ${markers.length}");
  }
  static Future<Uint8List?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        ?.buffer
        .asUint8List();
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
