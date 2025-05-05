import 'package:flutter_test_case/bindings/home_binding.dart';
import 'package:flutter_test_case/pages/home_page.dart';
import 'package:flutter_test_case/utils/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.home;

  static final routes = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
  ];
}
