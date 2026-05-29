import 'package:apolo/shared/controllers/app_controller.dart';
import 'package:apolo/shared/ui/menu/qubit_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QubitBody extends StatelessWidget {
  final Widget main;
  final Widget? rightWidget;
  final Widget? bottomWidget;
  final bool showDrawer;
  final bool showBottomBar;
  final bool showRightBar;
  const QubitBody({
    super.key,
    required this.main,
    this.rightWidget,
    this.bottomWidget,
    required this.showDrawer,
    required this.showBottomBar,
    required this.showRightBar,
  });

  @override
  Widget build(BuildContext context) {
    AppController appController = Get.put(AppController());

    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Visibility(
                visible: appController.devType.value != "Mobile" && showDrawer,
                child: Container(
                  color: Theme.of(context).colorScheme.surfaceContainer,
                  width: 305,
                  child: QubitMenu(),
                ),
              ),
              Expanded(
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: main,
                ),
              ),
              Visibility(
                visible:
                    appController.devType.value == "Desktop" && showRightBar,
                child: Container(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  width: 200,
                  child: rightWidget,
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: showBottomBar,
          child: Container(
            color: Theme.of(context).colorScheme.tertiary,
            height: 48,
            child: bottomWidget,
          ),
        ),
      ],
    );
  }
}
