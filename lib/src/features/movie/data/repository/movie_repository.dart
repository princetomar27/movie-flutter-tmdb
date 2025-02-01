import '../../../../core/network/api_constants.dart';
import '../datasource/movie_datasource.dart';
import '../entities/movie_model.dart';

class MovieRepository {
  final MoviesRemoteDataSource remoteDataSource;

  MovieRepository(this.remoteDataSource);

  Future<List<MovieModel>> getNowPlayingMovies() =>
      remoteDataSource.fetchMovies(ApiConstants.nowPlayingMovies);
  Future<List<MovieModel>> getPopularMovies() =>
      remoteDataSource.fetchMovies(ApiConstants.popularMovies);
  Future<List<MovieModel>> getTopRatedMovies() =>
      remoteDataSource.fetchMovies(ApiConstants.topRatedMovies);
  Future<List<MovieModel>> getUpcomingMovies() =>
      remoteDataSource.fetchMovies(ApiConstants.upcomingMovies);
  Future<List<MovieModel>> searchMovies(String query) =>
      remoteDataSource.searchMovies(query);
}
