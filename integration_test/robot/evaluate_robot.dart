import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class EvaluateRobot {
  final WidgetTester tester;

  EvaluateRobot(this.tester);

  Future<void> loadUI(Widget widget) async {
    await tester.pumpWidget(widget);
  }

  Future<void> typeInput(Key inputKey, String input) async {
    final inputFieldFinder = find.byKey(inputKey);
    await tester.tap(inputFieldFinder);
    await tester.enterText(inputFieldFinder, input);
    await tester.testTextInput.receiveAction(TextInputAction.done);
  }

  Future<void> tapButtonByKey(Key actionButtonKey) async {
    final actionButtonFinder = find.byKey(actionButtonKey);
    await tester.tap(actionButtonFinder);
    await tester.pump();
  }

  Future<void> tapButtonByType(Type type) async {
    final actionButtonFinder = find.byType(type);
    await tester.tap(actionButtonFinder);
    await tester.pump();
  }

  Future<void> verifyKeyExists(Key key) async {
    expect(find.byKey(key), findsOneWidget);
  }

  Future<void> verifyWidgetExists(Type widgetType) async {
    expect(find.byType(widgetType), findsOneWidget);
  }

  Future<void> verifyTextExists(String text) async {
    expect(find.text(text), findsOneWidget);
  }
}
