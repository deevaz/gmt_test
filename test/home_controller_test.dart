import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_case/home_controller.dart';
import 'package:flutter_test_case/user_model.dart';
import 'package:mockito/mockito.dart';

import 'helpers/test_helper.mocks.dart';
import 'utils/json_reader.dart';

void main() {
  late final HomeController controller;
  late final MockDio mockDio;

  setUp(() {
    mockDio = MockDio();
    controller = HomeController(mockDio);
  });

  group('fetchUsers', () {
    final tUserList =
        List.from(
          jsonDecode(readJson('dummy_data/list_user.json'))['data'],
        ).map((e) => UserModel.fromJson(e)).toList();

    test('isLoading should true when call fetchUsers', () async {
      // Arrange
      when(
        mockDio.get(
          'https://reqres.in/api/users',
          queryParameters: null,
          options: anyNamed('options'),
          cancelToken: null,
          onReceiveProgress: null,
        ),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: 'https://reqres.in/api/users'),
          statusCode: 200,
          data: jsonDecode(readJson('dummy_data/list_user.json')),
        ),
      );
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
          mockDio.get(
            'https://reqres.in/api/users',
            queryParameters: null,
            options: anyNamed('options'),
            cancelToken: null,
            onReceiveProgress: null,
          ),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: 'https://reqres.in/api/users'),
            statusCode: 200,
            data: jsonDecode(readJson('dummy_data/list_user.json')),
          ),
        );
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
          mockDio.get(
            'https://reqres.in/api/users',
            queryParameters: null,
            cancelToken: null,
            onReceiveProgress: null,
          ),
        ).thenAnswer(
          (_) async => Response(
            requestOptions: RequestOptions(path: 'https://reqres.in/api/users'),
            statusCode: 200,
            data: jsonDecode("{\"data\":[]}"),
          ),
        );
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
        mockDio.get(
          'https://reqres.in/api/users',
          queryParameters: null,
          options: anyNamed('options'),
          cancelToken: null,
          onReceiveProgress: null,
        ),
      ).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(path: 'https://reqres.in/api/users'),
          statusCode: 400,
        ),
      );
      // Act
      await controller.fetchUser();
      // Assert
      final result = controller.message;
      expect(result.value, 'Failed to fetch users');
    });
  });
}
