import 'package:apolo/shared/ui/useraction/user_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QubitAppbar {
  PreferredSizeWidget appBar(
    BuildContext context,
    IconData appBarIcon,
    String title,
    bool showActions,
  ) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Icon(appBarIcon, size: 30),
          ),
          Text(title),
        ],
      ),
      actions: showActions
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child:  IconButton(
                  icon: const Icon(Icons.notifications),
                  onPressed: () {
                    Get.toNamed('/notifications');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: UserAction(),
              ),
            ]
          : null,
    );
  }
}
