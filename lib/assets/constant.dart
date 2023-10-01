import 'package:flutter_dotenv/flutter_dotenv.dart';

class constantAPI {
  static String? key = dotenv.env['API_KEY'];

  static String get baseUrl =>
      'https://www.googleapis.com/youtube/v3/search?part=snippet&q=%s&key=$key';

  static String errorMassageAPI =  "Fail";
}
