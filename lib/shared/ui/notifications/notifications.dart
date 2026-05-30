import 'package:apolo/shared/ui/scaffold/qubit_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return QubitScaffold(
      iconAppbar: Icons.notifications,
      titleAppbar: 'Notificaciones',
      showActionsAppbar: true,
      showDrawer: true,
      showBottomBar: false,
      showRightBar: false,
      rightWidget: null,
      bottomWidget: null,
      main: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('notifications')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          final notifications = snapshot.data!.docs;
          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification =
                  notifications[index].data() as Map<String, dynamic>;
              return ListTile(
                tileColor: notification['isread']
                    ? Theme.of(context).colorScheme.surfaceContainer
                    : Theme.of(context).colorScheme.errorContainer,
                leading: Icon(Icons.notifications),
                title: Text(notification['title']),
                subtitle: Text(notification['body']),
                onTap: () {},
              );
            },
          );
        },
      ),
    );
  }
}
