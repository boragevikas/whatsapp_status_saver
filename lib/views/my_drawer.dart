import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_saver/controller/theme_controller.dart';
import 'package:status_saver/views/how_to_use.dart';

class MyDrawer extends StatefulWidget {
  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final ThemeController themeController = Get.put(ThemeController());

  final ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    bool isTrue = false;
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text("Status saver for whatsapp"),
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
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
