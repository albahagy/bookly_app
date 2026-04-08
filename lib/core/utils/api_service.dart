import 'package:dio/dio.dart';

class ApiService {
  final _url = 'https://www.googleapis.com/books/v1/';
  final _apiKey = 'AIzaSyAQH6e9eH75xcOpOPoV9aK4Km9tl68kT60';
  final Dio _dio;
  ApiService(this._dio);
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get(
      _url + endPoint,
      queryParameters: {'key': _apiKey},
    );
    return response.data;
  }
}
