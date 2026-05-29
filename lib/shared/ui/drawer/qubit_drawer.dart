import 'package:apolo/shared/ui/menu/qubit_menu.dart';
import 'package:flutter/material.dart';

class QubitDrawer extends StatelessWidget {
  const QubitDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(child: QubitMenu());
  }
}
