import 'package:flutter_test_case/controllers/home_controller.dart';
import 'package:flutter_test_case/utils/asset_loader.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssetLoader>(() => AssetLoader());
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
  }
}
