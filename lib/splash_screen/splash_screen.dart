import 'dart:async';
import 'package:chad_cafe/Auth/sign_auth.dart';
import 'package:chad_cafe/Screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller/controller.dart';
import '../global/global.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    Timer(const Duration(milliseconds: 4000), () {
      if (fauth.currentUser == null) {
        Get.offAll(const Signin());
      } else {
        ControllerMethods.readCurruentAdminInfo();
        Get.offAll(const HomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(
          'assets/chad.png',
          height: 250,
          width: 250,
        ),
      ),
    );
  }
}
