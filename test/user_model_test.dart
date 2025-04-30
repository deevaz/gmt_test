import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_case/user_model.dart';

void main() {
  test('should return a valid model from JSON', () async {
    // Arrange
    final jsonMap = {
      'id': 1,
      'email': 'email',
      'first_name': 'first_name',
      'last_name': 'last_name',
      'avatar': 'avatar',
    };
    // Act
    final result = UserModel.fromJson(jsonMap);
    // Assert
    expect(result.id, 1);
    expect(result.email, 'email');
    expect(result.firstName, 'first_name');
    expect(result.lastName, 'last_name');
    expect(result.avatar, 'avatar');
  });

  test('should return a JSON containing proper data', () async {
    // Arrange
    final tUserModel = const UserModel(
      id: 1,
      email: 'email',
      firstName: 'first_name',
      lastName: 'last_name',
      avatar: 'avatar',
    );
    // Act
    final result = tUserModel.toJson();
    // Assert
    expect(result, {
      'id': 1,
      'email': 'email',
      'first_name': 'first_name',
      'last_name': 'last_name',
      'avatar': 'avatar',
    });
  });
}
