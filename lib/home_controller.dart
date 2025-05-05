import 'dart:convert';

import 'package:flutter_test_case/user_model.dart';
import 'package:flutter_test_case/utils/asset_loader.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final AssetLoader _assetLoader;

  HomeController(this._assetLoader);

  @override
  void onInit() async {
    super.onInit();
    await fetchUser();
  }

  int? page = 1;
  int limit = 10;

  final isLoading = RxBool(false);
  final usersState = RxList<UserModel>();
  final message = RxString('');

  Future<void> fetchUser({bool refresh = false}) async {
    page = refresh ? 1 : page;

    if (page == null) return;

    if (page == 1) {
      isLoading.value = true;
    }

    try {
      final responseStr = await _assetLoader.loadString(
        'assets/json/dummy_users_$page.json',
      );
      final responseJson = jsonDecode(responseStr) as Map<String, dynamic>;

      final data = responseJson['data'] as List<dynamic>;
      final result = data.map((user) => UserModel.fromJson(user)).toList();

      page = (data.length == page) ? null : (page ?? 1) + 1;

      if (result.isEmpty) {
        if (refresh) {
          isLoading.value = false;
          usersState.value = [];
          return;
        }
        usersState.value = result;
      } else {
        usersState.assignAll([...usersState, ...result]);
      }
    } catch (e) {
      message.value = 'Failed to fetch users';
    }
  }
}
