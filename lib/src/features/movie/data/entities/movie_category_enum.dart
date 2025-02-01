enum MovieCategories {
  nowPlaying,
  popular,
  topRated,
  upcoming;

  String get categoryId {
    switch (this) {
      case MovieCategories.nowPlaying:
        return "now_playing";
      case MovieCategories.popular:
        return "popular";
      case MovieCategories.topRated:
        return "top_rated";
      case MovieCategories.upcoming:
        return "upcoming";

      default:
        return "now_playing";
    }
  }

  String get categoryTitle {
    switch (this) {
      case MovieCategories.nowPlaying:
        return "Now Playing";
      case MovieCategories.popular:
        return "Popular";
      case MovieCategories.topRated:
        return "Top Rated";
      case MovieCategories.upcoming:
        return "Upcoming";

      default:
        return "Now Playing";
    }
  }
}
