import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_saver/views/homeview.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(HomeView());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(), // add a beautiful spalash screen here
      ),
    );
  }
}
