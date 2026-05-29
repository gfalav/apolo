import 'package:apolo/shared/controllers/auth_controller.dart';
import 'package:apolo/shared/ui/logos/logo_edesal.dart';
import 'package:apolo/shared/ui/scaffold/qubit_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    final formKey = GlobalKey<FormState>();

    void sendSignIn() {
      if (formKey.currentState?.validate() ?? false) {
        authController.signIn();
      }
    }

    return Obx(
      () => QubitScaffold(
        iconAppbar: Icons.login,
        titleAppbar: 'Sign In',
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
                    "Bienvenido a Edesal App",
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
                Container(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: TextFormField(onFieldSubmitted: (value) => sendSignIn(),
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

                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8, left: 8),
                        child: ElevatedButton.icon(
                          onPressed: () => sendSignIn(),
                          label: const Text('Inicia Sesión'),
                          icon: Icon(Icons.login),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: TextButton(
                    onPressed: () => Get.toNamed('/resetpwd'),
                    child: Text("Olvidé mi contraseña"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 35, bottom: 16),
                  child: Text("No tienes una cuenta? Regístrate aquí."),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      child: ElevatedButton(
                        onPressed: () => Get.toNamed('/signup'),
                        child: Icon(Icons.mail),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      child: ElevatedButton(
                        onPressed: () => authController.signInWithGoogle(),
                        child: FaIcon(FontAwesomeIcons.google),
                      ),
                    ),
                    /* Padding(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      child: ElevatedButton(
                        onPressed: () => Get.to(SignUp()),
                        child: FaIcon(FontAwesomeIcons.facebook),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8, left: 8),
                      child: ElevatedButton(
                        onPressed: () => Get.to(SignUp()),
                        child: FaIcon(FontAwesomeIcons.apple),
                      ),
                    ), */
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
