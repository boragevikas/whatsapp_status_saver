// ignore_for_file: unnecessary_const

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_saver/controller/binding/status_controller.dart';
import 'package:status_saver/views/how_to_use.dart';
import 'package:status_saver/views/my_drawer.dart';
import 'package:status_saver/views/image_tab.dart';
import 'package:status_saver/views/video_tab.dart';

class HomeView extends StatefulWidget {
  final StatusController statusController = Get.put(StatusController());
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final StatusController statusController = Get.find();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Whatsapp status"),
            actions: [
              InkWell(
                  onTap: () {
                    Get.to(HowToUse());
                  },
                  child: const Icon(Icons.help)),
              const SizedBox(
                width: 5,
              )
            ],
            bottom: const TabBar(
              // labelColor: Colors.black,
              labelStyle: TextStyle(
                  fontSize: 16,
                  // color: Colors.black,
                  fontWeight: FontWeight.w600),
              tabs: const [
                Tab(
                  text: 'Images',
                ),
                Tab(
                  text: 'Videos',
                )
              ],
            ),
          ),
          drawer: MyDrawer(),
          body: TabBarView(children: [ImageTab(), VideoTab()])),
    );
  }
}
