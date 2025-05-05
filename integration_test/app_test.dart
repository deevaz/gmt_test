import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_case/home_controller.dart';
import 'package:flutter_test_case/home_page.dart';
import 'package:flutter_test_case/main.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';

import '../test/dummy_data/dummy_object.dart';
import '../test/helpers/test_helper.mocks.dart';
import 'robot/evaluate_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MockHomeController mockHomeController;

  setUp(() {
    mockHomeController = MockHomeController();

    Get.lazyPut<HomeController>(() => mockHomeController);
  });

  tearDown(() {
    Get.reset();
  });

  testWidgets('integrate all features', (tester) async {
    final evaluateRobot = EvaluateRobot(tester);

    when(mockHomeController.fetchUser()).thenAnswer((_) async => [tUserModel]);
    when(mockHomeController.isLoading).thenReturn(false.obs);
    when(mockHomeController.usersState).thenReturn([tUserModel].obs);
    when(mockHomeController.message).thenReturn(''.obs);

    await evaluateRobot.loadUI(const App());

    await evaluateRobot.verifyWidgetExists(HomePage);
    await evaluateRobot.verifyKeyExists(ValueKey('list_user'));
  });
}
