import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apolo/shared/controllers/auth_controller.dart';

class UserAction extends StatelessWidget {
  const UserAction({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return PopupMenuButton(
      child: Padding(
        padding: EdgeInsets.only(right: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
          child: Icon(
            size: 30,
            Icons.person,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      itemBuilder: (itemBuilder) {
        return [
          PopupMenuItem(value: "profile", child: Text("Profile")),
          PopupMenuItem(
            value: "change_password",
            child: Text("Change Password"),
            onTap: () => Get.toNamed('/changepwd'),
          ),
          PopupMenuItem(
            value: "logout",
            child: Text("Logout"),
            onTap: () => authController.signOut(),
          ),
        ];
      },
    );
  }
}
