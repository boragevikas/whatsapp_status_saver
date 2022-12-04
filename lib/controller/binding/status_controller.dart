import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:status_saver/constatnts/constatnts.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class StatusController extends GetxController {
  List<FileSystemEntity> getImages = [];
  List<FileSystemEntity> getVideos = [];
  RxBool isWhatsappAvailable = false.obs;
  RxBool _isFetch = false.obs;

  void getStatus(String ext) async {
    final status = await Permission.storage.request();

    Directory? directory = await getExternalStorageDirectory();

    if (status.isDenied) {
      Permission.storage.request();
      log(" ${status.toString()}");
      return;
    }
    if (status.isGranted) {
      final directory = Directory(AppConst.WHATSAPP_PATH);
      log(directory.path);

      if (directory.existsSync()) {
        final items = directory.listSync();

        if (ext == ".mp4") {
          getVideos =
              items.where((element) => element.path.endsWith(".mp4")).toList();
          refresh();
        } else {
          if (ext == ".jpg") {
            getImages = items
                .where((element) => element.path.endsWith(".jpg"))
                .toList();
            refresh();
          }
        }

        isWhatsappAvailable.value = false;
        log(items.toString());
      } else {
        log("No Whatsapp found");
        isWhatsappAvailable.value = true;
      }
    }
  }

  Future<String> getThumnail(String path) async {
    String? thumb = await VideoThumbnail.thumbnailFile(video: path);
    return thumb!;
  }
}
