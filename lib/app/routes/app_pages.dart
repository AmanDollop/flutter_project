import 'package:get/get.dart';

import '../modules/emoji/bindings/emoji_binding.dart';
import '../modules/emoji/views/emoji_view.dart';
import '../modules/google_map/bindings/google_map_binding.dart';
import '../modules/google_map/views/google_map_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/image_one/bindings/image_one_binding.dart';
import '../modules/image_one/views/image_one_view.dart';
import '../modules/imageupload/bindings/imageupload_binding.dart';
import '../modules/imageupload/views/imageupload_view.dart';
import '../modules/map_view/bindings/map_view_binding.dart';
import '../modules/map_view/views/map_view_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.GOOGLE_MAP,
      page: () => GoogleMapView(),
      binding: GoogleMapBinding(),
    ),
    GetPage(
      name: _Paths.MAP_VIEW,
      page: () => const MapViewView(),
      binding: MapViewBinding(),
    ),
    GetPage(
      name: _Paths.EMOJI,
      page: () => EmojiPickerView(),
      binding: EmojiBinding(),
    ),
    GetPage(
      name: _Paths.IMAGEUPLOAD,
      page: () => const ImageuploadView(),
      binding: ImageuploadBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_ONE,
      page: () => const ImageOneView(),
      binding: ImageOneBinding(),
    ),
  ];
}
