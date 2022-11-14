import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:status_saver/controller/theme_controller.dart';

class ThemeControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
  }
}
