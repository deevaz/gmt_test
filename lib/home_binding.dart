import 'package:dio/dio.dart';
import 'package:flutter_test_case/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => HomeController(Get.find()));
  }
}
