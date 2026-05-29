import 'package:apolo/shared/controllers/auth_controller.dart';
import 'package:apolo/shared/ui/auth/reset_pwd.dart';
import 'package:apolo/shared/ui/auth/sign_in.dart';
import 'package:apolo/shared/ui/auth/sign_up.dart';
import 'package:apolo/shared/ui/auth/change_pwd.dart';
import 'package:apolo/shared/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());

    return GetMaterialApp(
      title: 'Apolo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 0, 146),
        ),
        textTheme: GoogleFonts.notoSansTextTheme(Theme.of(context).textTheme),
      ),
      onReady: () => authController.setInitialRoute(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: '/signin',
          page: () => SignIn(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: '/signup',
          page: () => SignUp(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: '/resetpwd',
          page: () => ResetPwd(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 900),
        ),
        GetPage(
          name: '/changepwd',
          page: () => ChangePwd(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(milliseconds: 900),
        ),
      ],
    );
  }
}
