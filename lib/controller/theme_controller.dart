import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool? isDarkMode = true;

  void toggleDarkMode() {
    isDarkMode = isDarkMode;
    if (isDarkMode == true) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    update();
  }
}
