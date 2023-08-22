import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hear_ease_app/models/baby_state.dart';
import 'package:hear_ease_app/utils/os.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseroot = 'http://10.0.2.2:8000';

  Future<BabyState> getPrediction(
      {required String filePath, String api = '/'}) async {
    if (OsUtils.isFileExist(filePath) == false) {
      throw OSError('file $filePath not exist');
    }

    var apiBase = api[0] == '/' ? api.substring(1) : api;
    var uri = Uri.parse('$baseroot/$apiBase');

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
  }
}
