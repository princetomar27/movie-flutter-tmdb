class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

  static const String authToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZDYxYTA0N2E2MGM2Y2JjNTQ1YTYzMWUxZDQwMTEzNyIsIm5iZiI6MTY0MTExMjYxMy40MjEsInN1YiI6IjYxZDE2NDI1NGY1ODAxMDA2NzcwZjRiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fp1Ms10J_NEJQBRR4lZu-x3POOCn05FUFnxRowGvYI0';

  static Map<String, String> getHeaders() => {
        'Authorization': 'Bearer $authToken',
        'accept': 'application/json',
      };

  static String nowPlayingMovies = '$baseUrl/movie/now_playing';
  static String popularMovies = '$baseUrl/movie/popular';
  static String topRatedMovies = '$baseUrl/movie/top_rated';
  static String upcomingMovies = '$baseUrl/movie/upcoming';

  static String searchMovies(String query) =>
      '$baseUrl/search/movie?query=$query';

  static String movieDetails(int movieId) =>
      '$baseUrl/movie/$movieId?append_to_response=videos,credits';
}
