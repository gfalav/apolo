import 'package:apolo/shared/controllers/auth_controller.dart';
import 'package:apolo/shared/ui/logos/logo_edesal.dart';
import 'package:apolo/shared/ui/scaffold/qubit_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ChangePwd extends StatelessWidget {
  const ChangePwd({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    final formKey = GlobalKey<FormState>();

    void sendChangePwd() {
      if (formKey.currentState?.validate() ?? false) {
        authController.changePwd();
      }
    }

    return Obx(
      () => QubitScaffold(
        iconAppbar: Icons.lock,
        titleAppbar: 'Change Password',
        showActionsAppbar: true,
        showDrawer: true,
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
                    "Actualiza tu contraseña",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: TextFormField(
                    controller: authController.passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      suffix: IconButton(
                        onPressed: () => authController.setPasswordObscure(),
                        icon: Icon(Icons.lock, size: 20),
                      ),
                    ),
                    obscureText: authController.passwordObscure.value,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.password(
                        minLength: 6,
                        maxLength: 32,
                        minLowercaseCount: 1,
                        minUppercaseCount: 1,
                        minNumberCount: 1,
                        minSpecialCharCount: 1,
                        checkNullOrEmpty: true,
                        errorText:
                            "Debe contener 6 caracteres, al menos una letra mayúscula, una minúscula, un número y un carácter especial.",
                      ),
                    ]),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: TextFormField(
                    controller: authController.repasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirma Password',
                      suffix: IconButton(
                        onPressed: () => authController.setRepasswordObscure(),
                        icon: Icon(Icons.lock, size: 20),
                      ),
                    ),
                    obscureText: authController.repasswordObscure.value,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      (val) {
                        if (val != authController.passwordController.text) {
                          return 'Passwords no coinciden';
                        }
                        return null;
                      },
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
                          onPressed: () => sendChangePwd(),
                          label: const Text('Actualizar Contraseña'),
                          icon: Icon(Icons.lock),
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
      ),
    );
  }
}
