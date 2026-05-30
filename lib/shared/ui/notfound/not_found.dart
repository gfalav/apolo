import 'package:apolo/shared/ui/scaffold/qubit_scaffold.dart';
import 'package:flutter/material.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return QubitScaffold(
      iconAppbar: Icons.home,
      titleAppbar: 'Home',
      showActionsAppbar: true,
      showDrawer: true,
      showBottomBar: false,
      showRightBar: false,
      rightWidget: null,
      bottomWidget: null,
      main: Center(child: Text("Ruta no encontrada!")),
    );
  }
}
