import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entities/movie_category_enum.dart';
import '../../data/entities/movie_model.dart';
import '../../data/repository/movie_repository.dart';

part 'movie_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  final MovieRepository repository;
  final Map<String, List<MovieModel>> _moviesByCategory = {};

  Timer? debounce;
  final TextEditingController searchController = TextEditingController();

  MoviesCubit({required this.repository}) : super(MoviesInitial()) {
    addSearchListener();
  }

  bool get isSearchEmpty => searchController.text.trim().isEmpty;

  void addSearchListener() {
    searchController.addListener(autoSearchListener);
  }

  void autoSearchListener() {
    debounce?.cancel();
    debounce = null;
    debounce = Timer(
      Duration(milliseconds: 500),
      () {
        filterMovies(searchController.text);
      },
    );
  }

  void loadMovies(MovieCategories? category) async {
    emit(MoviesLoading(category?.categoryId ?? '', _moviesByCategory));

    try {
      List<MovieModel> movies;

      switch (category) {
        case MovieCategories.popular:
          movies = await repository.getPopularMovies();
          break;
        case MovieCategories.topRated:
          movies = await repository.getTopRatedMovies();
          break;
        case MovieCategories.upcoming:
          movies = await repository.getUpcomingMovies();
          break;
        default:
          movies = await repository.getNowPlayingMovies();
      }

      _moviesByCategory[category?.categoryId ?? ''] = movies;

      emit(MoviesLoaded(Map.from(_moviesByCategory)));
    } catch (e) {
      emit(MoviesError(category?.categoryId ?? '', e.toString(),
          Map.from(_moviesByCategory)));
    }
  }

  void filterMovies(String query) {
    if (query.isEmpty) {
      emit(MoviesLoaded(Map.from(_moviesByCategory)));
    } else {
      final filteredMovies = _moviesByCategory.map((categoryId, movieList) {
        final filteredList = movieList.where((movie) {
          return movie.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
        return MapEntry(categoryId, filteredList);
      });

      emit(MoviesLoaded(filteredMovies));
    }
  }

  List<MovieModel> getFilteredMovies(MoviesLoaded state) {
    final query = searchController.text.toLowerCase();
    final allMovies =
        state.moviesByCategory.values.expand((movies) => movies).toList();
    return allMovies.where((movie) {
      return movie.title.toLowerCase().contains(query);
    }).toList();
  }
}
