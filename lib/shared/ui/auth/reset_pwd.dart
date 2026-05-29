import 'package:apolo/shared/controllers/auth_controller.dart';
import 'package:apolo/shared/ui/logos/logo_edesal.dart';
import 'package:apolo/shared/ui/scaffold/qubit_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ResetPwd extends StatelessWidget {
  const ResetPwd({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    final formKey = GlobalKey<FormState>();

    void sendReset() {
      if (formKey.currentState?.validate() ?? false) {
        authController.resetPwd();
      }
    }

    return QubitScaffold(
      iconAppbar: Icons.lock_reset,
      titleAppbar: 'Reset Password',
      showActionsAppbar: false,
      showDrawer: false,
      showBottomBar: false,
      showRightBar: false,
      rightWidget: null,
      bottomWidget: null,
      main: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LogoEdesal(),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 16),
                child: Text(
                  "Restablece tu contraseña",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: TextFormField(
                  controller: authController.emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      child: ElevatedButton.icon(
                        onPressed: () => sendReset(),
                        label: const Text('Restablecer'),
                        icon: Icon(Icons.person_add),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      child: ElevatedButton.icon(
                        onPressed: Get.back,
                        label: const Text('Cancela'),
                        icon: Icon(Icons.cancel),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
