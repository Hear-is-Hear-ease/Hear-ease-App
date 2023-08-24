import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hear_ease_app/models/baby_state.dart';
import 'package:hear_ease_app/utils/os.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  late String baseroot;

  ApiService() {
    baseroot = dotenv.env['API_BASE_ROOT'] ?? '';
  }

  Future<BabyState> getPrediction(
      {required String filePath, String api = '/'}) async {
    if (OsUtils.isFileExist(filePath) == false) {
      throw OSError('file $filePath not exist');
    }

    try {
      var uri = Uri.parse(baseroot);

      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', filePath));

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);
      var json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        debugPrint("Upload successful!");
      } else {
        debugPrint("Upload failed with status: ${response.statusCode}.");
      }
      return BabyState.fromJson(json);
    } catch (e) {
      debugPrintStack();
      throw "Error on ApiService";
    }
  }
}
