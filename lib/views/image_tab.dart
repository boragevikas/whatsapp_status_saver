import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_saver/controller/binding/status_controller.dart';
import 'package:status_saver/views/image_view.dart';

class ImageTab extends StatefulWidget {
  @override
  State<ImageTab> createState() => _ImageTabState();
}

class _ImageTabState extends State<ImageTab> {
  final StatusController statusController = Get.find()..getStatus(".jpg");

  @override
  Widget build(BuildContext context) {
    return statusController.isWhatsappAvailable.value
        ? const Center(child: Text("whatsapp not found"))
        : (statusController.getImages.isEmpty)
            ? const Center(child: Text("No images found"))
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  children:
                      List.generate(statusController.getImages.length, (index) {
                    final data = statusController.getImages[index];
                    log("images");
                    log(data.toString());
                    return InkWell(
                      onTap: (() {
                        Get.to(ImageView(
                          imagePath: data.path,
                        ));
                      }),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: FileImage(File(data.path))),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  }),
                ),
              );
  }
}
