import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/google_map_controller.dart';

class GoogleMapView extends GetView<GoogleMapControler> {
  GoogleMapView({Key? key}) : super(key: key);
  String dropdownValue = 'normal';
  List<Polyline> Polylines = [
    const Polyline(
      polylineId: PolylineId("Union Bank of India"),
      visible: true,
      startCap: Cap.roundCap,
      endCap: Cap.buttCap,
      points: <LatLng>[
        LatLng(22.689939, 75.864195),
        LatLng(22.692665, 75.867528),
        LatLng(22.697869, 75.877169),
        LatLng(22.699060, 75.877828),
        LatLng(22.700092, 75.877774),
        LatLng(22.701846, 75.877095),
        LatLng(22.702050, 75.877074),
        LatLng(22.703109, 75.876538),
        LatLng(22.704282, 75.876352),
        LatLng(22.704915, 75.878281),
        LatLng(22.708105, 75.878847),
        LatLng(22.711393, 75.882560),
        LatLng(22.713009, 75.883334),
        LatLng(22.716049, 75.883859),
        LatLng(22.718404, 75.884223)
      ],
      color: Colors.black87,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text('GoogleMapView'),
            centerTitle: true,
            actions: [
              DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                elevation: 16,
                underline: Container(
                  height: 2,
                ),
                onChanged: (String? newValue) {
                  dropdownValue = newValue!;
                },
                items: <String>['satellite', 'normal', 'terrain', 'hybrid']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          body: GoogleMap(
            initialCameraPosition: const CameraPosition(
                target: LatLng(22.689939, 75.864195), zoom: 15),
            //mapType: MapType.satellite,
            compassEnabled: true,
            trafficEnabled: true,
            markers: Set<Marker>.of(controller.markers),
            polylines: Polylines.toSet(),
          ),
        ),

    );
  }
}
