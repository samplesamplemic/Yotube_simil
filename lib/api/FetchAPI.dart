import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

import '/assets/constant.dart' as constant;
import '../Model/Video.dart';

class FetchAPI extends ChangeNotifier {
  final String _baseUrl = constant.constantAPI.baseUrl;
  final String errorMassage = constant.constantAPI.errorMassageAPI;
  late Future<Video> videoList;
  bool dataExist = false;

  Future<Video> fetchVideo(String wordToSearch, http.Client client) async {
    String url = sprintf(_baseUrl, [wordToSearch]);
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('-----------------------\n ${response.body} \n-----------------------');
      return Video.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(errorMassage);
    }
  }

  getVideoList(String wordToSearch) {
    videoList = fetchVideo(wordToSearch, http.Client());
    dataExist = true;
    notifyListeners();
  }
}
