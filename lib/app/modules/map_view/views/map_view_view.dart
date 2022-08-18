import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import '../controllers/map_view_controller.dart';

class MapViewView extends GetView<MapViewController> {
  const MapViewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MapViewView'),
        centerTitle: true,
      ),
      body: PlacePicker(
        apiKey: "AIzaSyAzeSaHWb4ulxr4RzbVq4AxuwEQMupxJLE",
        selectedPlaceWidgetBuilder:
            (_, selectedPlace, state, isSearchBarFocused) {
          return isSearchBarFocused
              ? Container()
              // Use FloatingCard or just create your own Widget.
              : FloatingCard(
                  bottomPosition: 0.0,
                  // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                  leftPosition: 0.0,
                  rightPosition: 0.0,
                  width: 500,
                  borderRadius: BorderRadius.circular(12.0),
                  child: state == SearchingState.Searching
                      ? Center(child: CircularProgressIndicator())
                      : RaisedButton(
                          onPressed: () {
                            print("do something with [selectedPlace] data");
                          },
                        ),
                );
        }, initialPosition:LatLng(22.689939, 75.864195),
        useCurrentLocation: true,
        selectInitialPosition: true,
        usePinPointingSearch: true,
        usePlaceDetailSearch: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
      ),
    );
  }
}
