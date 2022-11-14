import 'dart:developer';

import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  const VideoView({Key? key, this.videoPath}) : super(key: key);
  final String? videoPath;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  List<Widget> buttonsList = const [
    Icon(Icons.download),
    // Icon(Icons.delete),
    Icon(Icons.share_rounded)
  ];

  ChewieController? _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.file(
          File(widget.videoPath!),
        ),
        autoInitialize: true,
        autoPlay: true,
        aspectRatio: 5 / 8,
        looping: true,
        errorBuilder: ((context, errorMessage) {
          return Center(child: Text(errorMessage));
        }));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _chewieController?.pause();
    _chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Chewie(
        controller: _chewieController!,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 25, bottom: 30),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(buttonsList.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: FloatingActionButton(
                    heroTag: "$index",
                    onPressed: () {
                      switch (index) {
                        case 0:
                          log("Download");
                          ImageGallerySaver.saveFile(widget.videoPath!)
                              .then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Video Saved to gallery')));
                          });
                          break;
                        // case 1:
                        //   log("Delete");
                        //   break;
                        case 1:
                          log("Shear");
                          FlutterNativeApi.shareImage(widget.videoPath!);
                          break;
                      }
                    },
                    child: buttonsList[index]),
              );
            })),
      ),
    );
  }
}
