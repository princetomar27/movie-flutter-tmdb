import 'package:dio/dio.dart';
import 'api_constants.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    headers: ApiConstants.getHeaders(),
  ));

  Future<Response> getRequest(String url) async {
    return await _dio.get(url);
  }
}
