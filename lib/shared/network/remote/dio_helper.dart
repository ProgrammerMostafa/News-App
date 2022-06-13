import 'package:dio/dio.dart';

//baseUrl ->  https://newsapi.org
//method -->  v2/top-headlines
//query  -->  country=eg & category=business & apiKey=1367a17c58e446f294e5626e319488b4

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getResponse({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    return await dio!.get(url, queryParameters: query);
  }
}
