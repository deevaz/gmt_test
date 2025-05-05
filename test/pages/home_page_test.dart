import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_case/controllers/home_controller.dart';
import 'package:flutter_test_case/pages/home_page.dart';
import 'package:flutter_test_case/utils/app_routes.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

import '../dummy_data/dummy_object.dart';
import '../helpers/test_helper.mocks.dart';
import '../utils/test_http_overides.dart';

void main() {
  late final MockHomeController mockController;

  setUp(() {
    HttpOverrides.global = TestHttpOverrides();

    mockController = MockHomeController();

    Get.lazyPut<HomeController>(() => mockController);
  });

  tearDown(() {
    Get.reset();
  });

  Widget buildWidget() {
    return GetMaterialApp(
      initialRoute: AppRoutes.home,
      getPages: [GetPage(name: AppRoutes.home, page: () => const HomePage())],
    );
  }

  testWidgets('HomePage displays correct UI elements', (tester) async {
    when(mockController.fetchUser()).thenAnswer((_) async => [tUserModel]);
    when(mockController.isLoading).thenReturn(false.obs);
    when(mockController.usersState).thenReturn([tUserModel].obs);
    when(mockController.message).thenReturn(''.obs);

    await tester.pumpWidget(buildWidget());

    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byKey(const ValueKey('list_user')), findsOneWidget);
  });
}
