import 'package:apolo/shared/controllers/app_controller.dart';
import 'package:apolo/shared/ui/appbar/qubit_appbar.dart';
import 'package:apolo/shared/ui/body/qubit_body.dart';
import 'package:apolo/shared/ui/drawer/qubit_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QubitScaffold extends StatelessWidget {
  final IconData iconAppbar;
  final String titleAppbar;
  final bool showActionsAppbar;
  final bool showDrawer;
  final bool showBottomBar;
  final bool showRightBar;
  final Widget? main;
  final Widget? rightWidget;
  final Widget? bottomWidget;
  const QubitScaffold({
    super.key,
    required this.iconAppbar,
    required this.titleAppbar,
    required this.showActionsAppbar,
    required this.showDrawer,
    required this.showBottomBar,
    required this.showRightBar,
    required this.main,
    this.rightWidget,
    this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());
    appController.setDimensions(
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height,
    );

    return Obx(
      () => Scaffold(
        appBar: QubitAppbar().appBar(
          context,
          iconAppbar,
          titleAppbar,
          showActionsAppbar,
        ),
        drawer: appController.devType.value == 'Mobile' && showDrawer
            ? const QubitDrawer()
            : null,
        body: QubitBody(
          main: main ?? Container(),
          rightWidget: rightWidget ?? Container(),
          bottomWidget: bottomWidget ?? Container(),
          showDrawer: showDrawer,
          showBottomBar: showBottomBar,
          showRightBar: showRightBar,
        ),
      ),
    );
  }
}
