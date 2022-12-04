import 'package:permission_handler/permission_handler.dart';

Future<bool> requestStoragePermission() async {
  var storagePermission = await Permission.storage.status;

  await Permission.storage.request();
  if (await Permission.storage.request().isGranted) {
    return true;
  } else {
    return false;
  }
}
