import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_case/home_controller.dart';
import 'package:flutter_test_case/user_model.dart';
import 'package:mockito/mockito.dart';

import 'helpers/test_helper.mocks.dart';
import 'utils/json_reader.dart';

void main() {
  late final MockAssetLoader mockAssetLoader;
  late final HomeController controller;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    mockAssetLoader = MockAssetLoader();
    controller = HomeController(mockAssetLoader);
  });

  group('fetchUsers', () {
    final tUserList =
        List.from(
          jsonDecode(readJson('dummy_data/list_user.json'))['data'],
        ).map((e) => UserModel.fromJson(e)).toList();

    test('isLoading should true when call fetchUsers', () async {
      // Arrange
      when(
        mockAssetLoader.loadString('assets/json/dummy_users_1.json'),
      ).thenAnswer((_) async => readJson('dummy_data/list_user.json'));
      // Act
      controller.fetchUser();
      // Assert
      final result = controller.isLoading;
      expect(result.value, false);
    });

    test(
      'state should not empty when call data from remote successfully',
      () async {
        // Arrange
        when(
          rootBundle.loadString('assets/json/dummy_users_1.json'),
        ).thenAnswer((_) async => readJson('dummy_data/list_user.json'));
        // Act
        await controller.fetchUser();
        // Assert
        final result = controller.usersState;
        expect(result, tUserList);
      },
    );

    test(
      'state should empty when call data from remote successfully with empty data',
      () async {
        // Arrange
        when(
          rootBundle.loadString('assets/json/dummy_users_1.json'),
        ).thenAnswer((_) async => jsonDecode("{\"data\":[]}"));
        // Act
        await controller.fetchUser();
        // Assert
        final result = controller.usersState;
        expect(result, []);
      },
    );

    test('message should not empty when call from remote is failed', () async {
      // Arrange
      when(
        mockAssetLoader.loadString('assets/json/dummy_users_1.json'),
      ).thenAnswer((_) async => '');
      // Act
      await controller.fetchUser();
      // Assert
      final result = controller.message;
      expect(result.value, 'Failed to fetch users');
    });
  });
}
