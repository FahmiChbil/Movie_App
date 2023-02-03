class Url {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = 'apiKey=0d081622bde5c6ebc71db7cf689f3c65';

  static const String nowPlayingMovies =
      'https://api.themoviedb.org/3/movie/now_playing?apiKey=0d081622bde5c6ebc71db7cf689f3c65';
  static const String popularMovies = '$baseUrl/movie/popular?$apiKey';
  static const String topRating = '$baseUrl/movie/top_rated?$apiKey';
  static String movieDetail(int? id) => '$baseUrl/movie/$id?$apiKey';
  static String movieRecommendation(int id) =>
      '$baseUrl/movie/$id/recommendations?$apiKey';
  static String movieImages(int id) => '$baseUrl/movie/$id/images?$apiKey';
}
