import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailUser extends StatelessWidget {
  const DetailUser({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Get.arguments;
    return Scaffold(
        appBar: AppBar(title: Text('Detail User ${user.firstName}')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(user.avatar ?? '')),
              const SizedBox(height: 20),
              Text('Nama Lengkap: ${user.firstName} ${user.lastName}'),
              Text('Alamat Email: ${user.email}'),
            ],
          ),
        ));
  }
}
