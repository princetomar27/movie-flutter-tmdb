import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/injection_container.dart';
import '../../data/entities/movie_category_enum.dart';
import '../cubit/movie_cubit.dart';
import '../widgets/movie_category_widget.dart';
import '../widgets/movie_details_widget.dart';
import '../widgets/movie_list_widget.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit(repository: sl())
        ..loadMovies(MovieCategories.values.first),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Movies App"),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  return TextField(
                    controller: context.read<MoviesCubit>().searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for movies...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        body: BlocBuilder<MoviesCubit, MoviesState>(
          builder: (context, state) {
            if (state is MoviesLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MoviesLoaded) {
              if (context.read<MoviesCubit>().isSearchEmpty) {
                return ListView(
                  children: MovieCategories.values.map((category) {
                    return MovieCategoryWidget(category: category);
                  }).toList(),
                );
              }

              final filteredMovies =
                  context.read<MoviesCubit>().getFilteredMovies(state);

              return ListView.builder(
                itemCount: filteredMovies.length,
                itemBuilder: (context, index) {
                  final movie = filteredMovies[index];
                  return GestureDetector(
                    onTap: () {
                      NavigationHelper.navigateTo(
                        context,
                        MovieDetailScreen(movie: movie),
                      );
                    },
                    child: MovieListWidget(
                      movies: [movie],
                      category: MovieCategories.popular,
                    ),
                  );
                },
              );
            }

            return const Center(child: Text("No movies found."));
          },
        ),
      ),
    );
  }
}
