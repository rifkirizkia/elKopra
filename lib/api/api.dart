import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class Api with ChangeNotifier{
  Future<Dio> apiNormal() async{
    BaseOptions dioOption = BaseOptions(baseUrl: 'https://newsapi.org/v2/', responseType: ResponseType.json, headers: {
      "Content-Type": Headers.jsonContentType,
      "Accept": Headers.jsonContentType,
    });
    Dio dio = Dio(dioOption);
    return dio;
  }
    _getRequest({required String endpoint, param}) async {
    try {
      final dio = await apiNormal();
      final res = await dio.get(endpoint, queryParameters: param);
      return res.data;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        print("timeout");
      }
    } catch (e) {
      print("error");
    }
  }

  Future<Map<String, dynamic>?> getNews() async {
    final result = await _getRequest(endpoint: 'everything?q=tesla&from=2023-10-08&sortBy=publishedAt&apiKey=ae9d63e642a2462f9304889476937b12');
    return result;
  }
}