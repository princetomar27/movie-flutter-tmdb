part of 'movie_cubit.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();

  @override
  List<Object> get props => [];
}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {
  final String categoryId;
  final Map<String, List<MovieModel>> moviesByCategory;

  MoviesLoading(this.categoryId, this.moviesByCategory);

  @override
  List<Object> get props => [categoryId, moviesByCategory];
}

class MoviesLoaded extends MoviesState {
  final Map<String, List<MovieModel>> moviesByCategory;

  MoviesLoaded(this.moviesByCategory);

  @override
  List<Object> get props => [moviesByCategory];
}

class MoviesError extends MoviesState {
  final String categoryId;
  final String message;
  final Map<String, List<MovieModel>> moviesByCategory;

  MoviesError(this.categoryId, this.message, this.moviesByCategory);

  @override
  List<Object> get props => [categoryId, message, moviesByCategory];
}
