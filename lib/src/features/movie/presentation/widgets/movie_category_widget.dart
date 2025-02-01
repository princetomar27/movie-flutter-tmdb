import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../presentation/paddings.dart';
import '../../data/entities/movie_category_enum.dart';
import '../cubit/movie_cubit.dart';
import 'movie_list_widget.dart';

class MovieCategoryWidget extends StatelessWidget {
  final MovieCategories category;

  const MovieCategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<MoviesCubit>();

    final state = context.watch<MoviesCubit>().state;
    if (state is MoviesLoaded &&
        !state.moviesByCategory.containsKey(category.categoryId)) {
      cubit.loadMovies(category);
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          padding12,
          Text(
            category.categoryTitle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          BlocBuilder<MoviesCubit, MoviesState>(
            builder: (context, state) {
              if (state is MoviesLoading &&
                  state.categoryId == category.categoryId) {
                return const CircularProgressIndicator();
              } else if (state is MoviesLoaded &&
                  state.moviesByCategory.containsKey(category.categoryId)) {
                return MovieListWidget(
                  movies: state.moviesByCategory[category.categoryId]!,
                  category: category,
                );
              } else if (state is MoviesError &&
                  state.categoryId == category.categoryId) {
                return Text(state.message,
                    style: const TextStyle(color: Colors.red));
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
