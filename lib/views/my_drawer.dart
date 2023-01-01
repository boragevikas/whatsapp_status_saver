import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_saver/controller/binding/status_controller.dart';
import 'package:status_saver/controller/theme_controller.dart';
import 'package:status_saver/views/how_to_use.dart';
import 'package:status_saver/views/webview.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final ThemeController themeController = Get.put(ThemeController());

  final ThemeController _themeController = Get.find();
  final StatusController statusController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isTrue = false;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              children: [
                Container(
                    width: 150,
                    height: 100,
                    // decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Image(
                      image: AssetImage("Assets/images/whatsapp_logo.png"),
                      fit: BoxFit.scaleDown,
                    )),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Status saver for whatsapp",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: const Text('Switch To Whatsapp Bussiness'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help,
            ),
            title: const Text('How to use'),
            onTap: () {
              Get.to(HowToUse());
            },
          ),
          ListTile(
            leading: Switch(
              value: isTrue,
              onChanged: (value) {
                setState(() {
                  isTrue == value;
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
            title: const Text('Dark'),
            onTap: () {
              Get.changeTheme(ThemeData.dark());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.share_rounded,
            ),
            title: const Text('Shear'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.share_rounded,
            ),
            title: const Text('Privacy Policy'),
            onTap: () {
              Get.to(MyWebview());
              // Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
