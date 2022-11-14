import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_saver/controller/binding/status_controller.dart';
import 'package:status_saver/views/video_view.dart';

class VideoTab extends StatefulWidget {
  @override
  State<VideoTab> createState() => _VideoTabState();
}

class _VideoTabState extends State<VideoTab> {
  final StatusController statusController = Get.find()..getStatus(".mp4");

  @override
  Widget build(BuildContext context) {
    return statusController.isWhatsappAvailable.value
        ? const Center(child: Text("whatsapp not found"))
        : (statusController.getVideos.isEmpty)
            ? const Center(child: Text("No videos found"))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  children:
                      List.generate(statusController.getVideos.length, (index) {
                    final data = statusController.getVideos[index];
                    log("Videos");
                    log(data.toString());
                    return FutureBuilder<String>(
                        future: statusController.getThumnail(data.path),
                        builder: (Context, Snapshot) {
                          return Snapshot.hasData
                              ? InkWell(
                                  onTap: (() {
                                    Get.to(VideoView(
                                      videoPath: data.path,
                                    ));
                                  }),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              FileImage(File(Snapshot.data!))),
                                    ),
                                  ),
                                )
                              : const Center(
                                  child: CircularProgressIndicator());
                        });
                  }),
                ),
              );
  }
}
