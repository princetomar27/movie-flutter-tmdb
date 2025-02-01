import 'package:flutter/material.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/constants/navigation_constants.dart';
import '../../../../presentation/dialogs/info_alert_dialog.dart';
import '../../data/entities/movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;

  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  children: [
                    Image.network(
                      "https://image.tmdb.org/t/p/w500${movie.backdropPath}",
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                            Colors.black.withOpacity(0.6),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 16,
                      child: GestureDetector(
                        onTap: () => NavigationHelper.goBack(context),
                        child: CircleAvatar(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 24),
                              const SizedBox(width: 5),
                              Text(
                                "${movie.voteAverage}/10",
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.date_range, color: Colors.grey),
                              const SizedBox(width: 5),
                              Text(
                                "Release Date: ${movie.releaseDate}",
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Overview",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            movie.overview,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                showInfoAlertDialog(
                                  context: context,
                                  title: 'Feature In-Progress',
                                  description: 'Will be implemented',
                                  onTap: () {
                                    NavigationHelper.goBack(context);
                                  },
                                );
                              },
                              icon: const Icon(Icons.play_arrow),
                              label: const Text("Watch Trailer"),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
