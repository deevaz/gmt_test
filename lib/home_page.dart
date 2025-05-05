import 'package:flutter/material.dart';
import 'package:flutter_test_case/home_controller.dart';
import 'package:get/state_manager.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.message.value.isNotEmpty) {
            return Center(child: Text(controller.message.value));
          } else {
            return ListView.builder(
              key: const ValueKey('list_user'),
              itemCount: controller.usersState.length,
              itemBuilder: (context, index) {
                final user = controller.usersState[index];
                return ListTile(
                  title: Text(user.firstName ?? ''),
                  subtitle: Text(user.lastName ?? ''),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar ?? ''),
                  ),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
