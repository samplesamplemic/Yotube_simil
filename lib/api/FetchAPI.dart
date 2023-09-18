import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

import '/assets/constant.dart' as Constant;
import '../Model/Video.dart';

class FetchAPI extends ChangeNotifier {
  final String _baseUrl = Constant.constant.baseUrl;
  late Future<Video> videoList;
  bool dataExist = false;

  Future<Video> fetchVideo(String wordToSearch) async {
    String url = sprintf(_baseUrl, [wordToSearch]);
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('${response.body} \n-----------------------');
      return Video.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Fail');
    }
  }

  getVideoList(String wordToSearch) {
    videoList = fetchVideo(wordToSearch);
    dataExist = true;
    notifyListeners();
  }
}
