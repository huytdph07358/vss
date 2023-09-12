import 'dart:convert';
import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:path_provider/path_provider.dart';

class TokenStorage {
  static Future<String> get _getDirPath async {
    Directory dir = await getApplicationDocumentsDirectory();
    // Directory dir1 = await getTemporaryDirectory();
    // Directory dir2 = await getApplicationSupportDirectory();
    // List<Directory>? dir3 =
    //     await getExternalStorageDirectories(type: StorageDirectory.documents);
    //
    // List<String> paths;
    // // getExternalStorageDirectories() will return list containing internal storage directory path
    // // And external storage (SD card) directory path (if exists)
    // paths = await ExternalPath.getExternalStorageDirectories();

    String pathDIRECTORY_DOCUMENTS;

    pathDIRECTORY_DOCUMENTS =
        await ExternalPath.getExternalStoragePublicDirectory(
            ExternalPath.DIRECTORY_MUSIC);
    if (pathDIRECTORY_DOCUMENTS.isNotEmpty) {
      return pathDIRECTORY_DOCUMENTS;
    }
    return dir.path;
  }

  // This function is triggered when the "Read" button is pressed
  static Future<String> readData() async {
    String data = '';
    final dirPath = await _getDirPath;
    final myFile = File('$dirPath/devicesso/devicedata.txt');
    final Directory myDirect = Directory('$dirPath/.devicesso/');
    //TODO
    // if (!await myDirect.exists()) {
    //   myDirect.create(recursive: true);
    // }

    if (await myFile.exists()) {
      //data = await myFile.readAsString(encoding: utf8);
    }
    return data;
  }

  static Future<void> writeData(String tokenData) async {
    final dirPath = await _getDirPath;

    final Directory myDirect = Directory('$dirPath/.devicesso/');
    if (!await myDirect.exists()) {
      myDirect.create(recursive: true);
    }
//TODO
    // final myFile = File('$dirPath/.token/tokendata.txt');
    // if (!await myFile.exists()) {
    //   await myFile.create(recursive: true);
    // }
    // If data.txt doesn't exist, it will be created automatically

    //await myFile.writeAsString(tokenData);
  }
}
