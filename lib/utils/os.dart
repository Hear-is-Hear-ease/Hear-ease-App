import 'dart:io';

class OsUtils {
  static Future<bool> copyFile(String filePath, String newFilePath) async {
    try {
      File file = File(filePath);
      file.copySync(newFilePath);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  static Future<bool> deleteFile(String filePath) async {
    try {
      final file = File(filePath);
      if (file.existsSync()) {
        file.deleteSync();
        return true;
      }
      throw Exception(
          'Can not delete file: file not found with path $filePath');
    } catch (e) {
      print(e);
      return false;
    }
  }

  static bool isFileExist(String filePath) {
    return File(filePath).existsSync();
  }
}
