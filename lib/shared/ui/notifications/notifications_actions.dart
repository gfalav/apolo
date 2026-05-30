import 'package:apolo/shared/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsActions extends StatelessWidget {
  const NotificationsActions({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return Obx(
      () => StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("notifications")
            .where('uid', isEqualTo: authController.uid.value)
            .where('isread', isEqualTo: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final notifications = snapshot.data!.docs;
          return IconButton(
            onPressed: () => Get.toNamed('/notifications'),
            icon: notifications.isNotEmpty
                ? Badge(
                    label: Text(notifications.length.toString()),
                    child: Icon(Icons.notifications),
                  )
                : Icon(Icons.notifications_none),
          );
        },
      ),
    );
  }
}
