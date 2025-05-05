import 'package:dio/dio.dart';
import 'package:flutter_test_case/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Dio _dio;

  HomeController(this._dio);

  @override
  void onInit() async {
    super.onInit();
    await fetchUser();
  }

  final isLoading = RxBool(false);
  final usersState = RxList<UserModel>();
  final message = RxString('');

  Future<void> fetchUser() async {
    isLoading.value = true;

    final headers = {'x-api-key': 'reqres-free-v1'};
    final response = await _dio.get(
      'https://reqres.in/api/users',
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      final responseJson = response.data['data'] as List;
      final result =
          responseJson.map((user) => UserModel.fromJson(user)).toList();
      usersState.value = result;
    } else {
      message.value = 'Failed to fetch users';
    }
  }
}
