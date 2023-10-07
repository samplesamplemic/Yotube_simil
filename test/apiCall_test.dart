import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quack_pics/Model/Video.dart';
import 'package:quack_pics/api/FetchAPI.dart';
import 'package:quack_pics/assets/constant.dart';
import 'package:sprintf/sprintf.dart';

import 'apiCall_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('fetchVideoList', () {
    test('returns a Video List if http call has successfully response', () async {
      final client = MockClient();
      await dotenv.load();

      String baseUrl = constantAPI.baseUrl;
      String url = sprintf(baseUrl, ['batman']);
      final responseJson = await rootBundle.loadString('response.json');

      when(client.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response(responseJson, 200, headers: {
                HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
              }));
      expect(await FetchAPI().fetchVideo('batman', client), isA<Video>());
    });

    test('throws exception if API call fail', () async {
      final client = MockClient();
      await dotenv.load();

      String baseUrl = constantAPI.baseUrl;
      String url = sprintf(baseUrl, ['skyfall']);

      when(client.get(Uri.parse(url)))
          .thenAnswer((_) async => http.Response('Not Found', 404));
      expect(FetchAPI().fetchVideo('skyfall', client), throwsException);
    });
  });
}
