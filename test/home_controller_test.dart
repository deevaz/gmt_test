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
          json.decode(readJson('dummy_data/list_user.json'))['data'],
        ).map((e) => UserModel.fromJson(e)).toList();

    test(
      'state should not empty when call data from remote successfully',
      () async {
        // Arrange
        when(
          mockDio.get(
            'https://reqres.in/api/users',
            options: Options(headers: {'x-api-key': 'reqres-free-v1'}),
          ),
        ).thenAnswer(
          (_) async => Response(
            data: tUserList,
            statusCode: 200,
            requestOptions: RequestOptions(),
          ),
        );
        // Act
        await controller.fetchUser();
        // Assert
        final result = controller.usersState;
        expect(result, tUserList);
      },
    );
  });
}
