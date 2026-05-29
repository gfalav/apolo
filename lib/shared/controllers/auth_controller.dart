import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;

  final uid = ''.obs;
  final email = ''.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repasswordController = TextEditingController();
  final passwordObscure = true.obs;
  final repasswordObscure = true.obs;

  void setPasswordObscure() {
    passwordObscure.value = !passwordObscure.value;
  }

  void setRepasswordObscure() {
    repasswordObscure.value = !repasswordObscure.value;
  }

  @override
  void onInit() {
    super.onInit();
    _auth.authStateChanges().listen((User? user) {
      if (user != null) {
        uid.value = user.uid;
      } else {
        uid.value = '';
      }
    });

    ever(uid, (callback) => setInitialRoute());
  }

  void setInitialRoute() {
    if (uid.value == '') {
      Get.offAllNamed('/signin');
    } else {
      Get.offAllNamed('/');
    }
  }

  Future<void> signUp() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await _auth.currentUser!.sendEmailVerification();
      await _auth.signOut();
      Get.snackbar(
        'Success',
        'Verifique su email para ativar su cuenta',
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Sign Up Error',
        e.message!,
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.snackbar(
        'Bienvenido!',
        '',
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.primaryContainer,
        colorText: Theme.of(Get.context!).colorScheme.primary,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Sign In Error',
        e.message!,
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    Get.snackbar(
      'Hasta luego!',
      '',
      duration: const Duration(seconds: 5),
      backgroundColor: Theme.of(Get.context!).colorScheme.primaryContainer,
      colorText: Theme.of(Get.context!).colorScheme.primary,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  Future<void> changePwd() async {
    try {
      await _auth.currentUser!.updatePassword(passwordController.text);
      await _auth.signOut();
      Get.snackbar(
        'Success',
        'Contraseña actualizada correctamente. Por favor, inicie sesión de nuevo.',
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.primaryContainer,
        colorText: Theme.of(Get.context!).colorScheme.primary,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Change Password Error',
        e.message!,
        duration: const Duration(seconds: 5),
        backgroundColor: Theme.of(Get.context!).colorScheme.errorContainer,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> resetPwd() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailController.text);
      Get.snackbar(
        "Success",
        "Verifique su email para restablecer su contraseña",
        backgroundColor: Get.theme.colorScheme.primaryContainer,
        colorText: Get.theme.colorScheme.primary,
        duration: Duration(seconds: 5),
      );
      Get.offAllNamed('/signin');
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Error",
        e.message ?? "An unknown error occurred",
        backgroundColor: Get.theme.colorScheme.errorContainer,
        colorText: Get.theme.colorScheme.error,
        duration: Duration(seconds: 5),
      );
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();

      googleProvider.addScope(
        'https://www.googleapis.com/auth/contacts.readonly',
      );
      googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

      return await _auth.signInWithPopup(googleProvider);
    } else {
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    }
  }
}
