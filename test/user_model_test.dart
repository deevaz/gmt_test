import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_case/user_model.dart';

void main() {
  final tUserJson = {
    'id': 1,
    'email': 'email',
    'first_name': 'first_name',
    'last_name': 'last_name',
    'avatar': 'avatar',
  };

  final tUserModel = const UserModel(
    id: 1,
    email: 'email',
    firstName: 'first_name',
    lastName: 'last_name',
    avatar: 'avatar',
  );

  test('should return a valid model from JSON', () async {
    // Arrange
    final jsonMap = tUserJson;
    // Act
    final result = UserModel.fromJson(jsonMap);
    // Assert
    expect(result, tUserModel);
  });

  test('should return a JSON containing proper data', () async {
    // Act
    final result = tUserModel.toJson();
    // Assert
    expect(result, tUserJson);
  });
}
