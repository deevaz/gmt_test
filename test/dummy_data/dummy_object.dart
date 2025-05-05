import 'package:flutter_test_case/user_model.dart';

final dumpImageUrl =
    'https://www.google.com/imgres?q=placeholder%20image&imgurl=https%3A%2F%2Fwww.svgrepo.com%2Fshow%2F508699%2Flandscape-placeholder.svg&imgrefurl=https%3A%2F%2Fwww.svgrepo.com%2Fsvg%2F508699%2Flandscape-placeholder&docid=9QbaVFfobw8WtM&tbnid=ILb0VdrDiOSHxM&vet=12ahUKEwj3t-L3k4yNAxXgV2wGHbv9NgMQM3oECBYQAA..i&w=800&h=800&hcb=2&ved=2ahUKEwj3t-L3k4yNAxXgV2wGHbv9NgMQM3oECBYQAA';

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
