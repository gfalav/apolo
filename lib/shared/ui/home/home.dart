import 'package:apolo/shared/controllers/auth_controller.dart';
import 'package:apolo/shared/ui/scaffold/qubit_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return QubitScaffold(
      iconAppbar: Icons.home,
      titleAppbar: 'Home',
      showActionsAppbar: true,
      showDrawer: true,
      showBottomBar: false,
      showRightBar: false,
      rightWidget: null,
      bottomWidget: null,
      main: Obx(
        () => Center(child: Text("Bienvenido, ${authController.uid.value}!")),
      ),
    );
  }
}
