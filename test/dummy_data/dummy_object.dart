import 'package:flutter_test_case/models/user_model.dart';

final dumpImageUrl =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9zcd-dwhaQPEzwe_fWYDMtVVze35Ad5nMHkSk7nxMpBrOtH3_C0wVTz_z6qkVjtYdydw&usqp=CAU';

final tUserJson = {
  'id': 1,
  'email': 'email',
  'first_name': 'first_name',
  'last_name': 'last_name',
  'avatar': dumpImageUrl,
};

final tUserModel = UserModel(
  id: 1,
  email: 'email',
  firstName: 'first_name',
  lastName: 'last_name',
  avatar: dumpImageUrl,
);
