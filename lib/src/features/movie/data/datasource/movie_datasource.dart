import 'package:dio/dio.dart';

import '../../../../core/network/api_constants.dart';
import '../entities/movie_model.dart';

class MoviesRemoteDataSource {
  final Dio _dio = Dio();

  Future<List<MovieModel>> fetchMovies(String url) async {
    final response = await _dio.get(url,
        options: Options(headers: ApiConstants.getHeaders()));
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await _dio.get(ApiConstants.searchMovies(query),
        options: Options(headers: ApiConstants.getHeaders()));
    if (response.statusCode == 200) {
      return (response.data['results'] as List)
          .map((e) => MovieModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load search results');
    }
  }
}
