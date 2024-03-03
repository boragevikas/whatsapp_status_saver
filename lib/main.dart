import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:status_saver/controller/binding/homeview_binding.dart';
// import 'package:status_saver/views/homeview.dart';
import 'package:status_saver/views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Ststus saver app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
