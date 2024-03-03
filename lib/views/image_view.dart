import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
// import 'package:get/get.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';

class ImageView extends StatefulWidget {
  final String? imagePath;
  const ImageView({Key? key, this.imagePath}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  List<Widget> buttonsList = const [
    Icon(Icons.download),
    Icon(Icons.print),
    Icon(Icons.share_rounded)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.scaleDown, image: FileImage(File(widget.imagePath!))),
          // color: Colors.white
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(buttonsList.length, (index) {
              return FloatingActionButton(
                  heroTag: "$index",
                  onPressed: () async {
                    switch (index) {
                      case 0:
                        log("Download");
                        ImageGallerySaver.saveFile(widget.imagePath!)
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Image Saved to gallery')));
                        });
                        break;
                      case 1:
                        log("Print");
                        FlutterNativeApi.printImage(widget.imagePath!,
                            widget.imagePath!.split("/").last);
                        break;
                      case 2:
                        log("Shear");
                        FlutterNativeApi.shareImage(widget.imagePath!);
                        break;
                    }
                  },
                  child: buttonsList[index]);
            })),
      ),
    );
  }
}
