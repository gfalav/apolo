import 'package:apolo/shared/ui/scaffold/qubit_scaffold.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotificationDetails extends StatelessWidget {
  const NotificationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final String args = Get.arguments ?? "No se han recibido argumentos";

    return QubitScaffold(
      iconAppbar: Icons.details,
      titleAppbar: 'Notificación',
      showActionsAppbar: true,
      showDrawer: true,
      showBottomBar: false,
      showRightBar: false,
      rightWidget: null,
      bottomWidget: null,
      main: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("notifications")
            .doc(args)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          final notification = snapshot.data!;
          if (notification['isread'] == false) {
            FirebaseFirestore.instance
                .collection("notifications")
                .doc(args)
                .update({'isread': true, 'fread': DateTime.now()});
          }
          return Card(
            elevation: 4, // Sombra de la tarjeta
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Ajusta el tamaño al contenido
                children: [
                  // ID del documento (Opcional, útil para debug o referencia)
                  Text(
                    'Nis: ${notification['nis']}',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                  const Divider(),

                  // Título y Subtítulo estilo lista
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      notification['title'] ?? 'Sin título',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        notification['subtitle'] ?? 'Sin subtítulo',
                        style: TextStyle(
                          color: Colors.blueGrey[600],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Cuerpo del mensaje
                  Text(
                    notification['body'] ?? 'Sin cuerpo',
                    style: const TextStyle(fontSize: 16, height: 1.4),
                  ),
                  ListTile(
                    trailing: Text(
                      "Notificado el ${DateFormat('dd/MM/yyyy - HH:mm').format(notification['fread'].toDate())}",
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
