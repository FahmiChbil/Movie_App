import 'dart:convert';

import 'package:movieapp/core/errors/exceptions.dart';
import 'package:movieapp/core/urls.dart';
import 'package:movieapp/features/movie/data/models/CastModel.dart';
import 'package:movieapp/features/movie/data/models/imagess_model.dart';
import 'package:movieapp/features/movie/data/models/movieModel.dart';
import 'package:movieapp/features/movie/data/models/movie_detail.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/features/movie/domain/entities/one_cast.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Stream<List<MovieModel>> getStreamData();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<List<MovieModel>> getUpComingMovie();
  Future<MovieDetailModel> getmMovieDetail(int? id);
  Future<List<MovieModel>> getMovieRecommendation(int id);
  Future<ImagessModel> getMovieImages(int id);
  Future<List<Cast>> getCasts(int id);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  MovieRemoteDataSourceImpl();
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing/?api_key=0d081622bde5c6ebc71db7cf689f3c65&page=1'));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      print(decodedJson);
      List<dynamic> decoded = decodedJson['results'];
      print(decoded);
      List<MovieModel> popularMovie =
          decoded.map((e) => MovieModel.fromJson(e)).toList();

      return popularMovie;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ImagessModel> getMovieImages(int id) async {
    final response = await http.get(Uri.parse(Url.movieImages(id)));
    if (response.statusCode == 200) {
      List decodedJson = jsonDecode(response.body);
      ImagessModel imagesModel =
          decodedJson.map((e) => ImagessModel.fromJson(e)) as ImagessModel;
      return imagesModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getMovieRecommendation(int id) async {
    final response = await http.get(Uri.parse(Url.movieRecommendation(id)));
    if (response.statusCode == 200) {
      List decodedJson = jsonDecode(response.body);
      List<MovieModel> movieRecommendation =
          decodedJson.map((e) => MovieModel.fromJson(e)).toList();
      return movieRecommendation;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular/?api_key=0d081622bde5c6ebc71db7cf689f3c65&page=1'));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      print(decodedJson);
      List<dynamic> decoded = decodedJson['results'];
      print(decoded);
      List<MovieModel> popularMovie =
          decoded.map((e) => MovieModel.fromJson(e)).toList();

      return popularMovie;
    } else {
      print("yes");
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/top_rated/?api_key=0d081622bde5c6ebc71db7cf689f3c65&page=1'));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      print(decodedJson);
      List<dynamic> decoded = decodedJson['results'];
      print(decoded);
      List<MovieModel> popularMovie =
          decoded.map((e) => MovieModel.fromJson(e)).toList();

      return popularMovie;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieDetailModel> getmMovieDetail(int? id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id?api_key=0d081622bde5c6ebc71db7cf689f3c65'));
    print(Url.movieDetail(id));
    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      MovieDetailModel movieDetailModel =
          MovieDetailModel.fromJson(decodedJson);
      return movieDetailModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Stream<List<MovieModel>> getStreamData() async* {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/popular/?api_key=0d081622bde5c6ebc71db7cf689f3c65&page=1'));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      print(decodedJson);
      List<dynamic> decoded = decodedJson['results'];
      print(decoded);
      List<MovieModel> popularMovie =
          decoded.map((e) => MovieModel.fromJson(e)).toList();

      yield popularMovie;
    } else {
      print("yes");
      throw ServerException();
    }
  }

  @override
  Future<List<Cast>> getCasts(int id) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=0d081622bde5c6ebc71db7cf689f3c65'));

    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      List<dynamic> decoded = decodedJson['cast'];
      List<Cast> MovieCasts =
          decoded.map((e) => CastModel.fromJson(e)).toList();
      return MovieCasts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getUpComingMovie() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming/?api_key=0d081622bde5c6ebc71db7cf689f3c65&page=1'));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      print(decodedJson);
      List<dynamic> decoded = decodedJson['results'];
      print(decoded);
      List<MovieModel> upcomingMovie =
          decoded.map((e) => MovieModel.fromJson(e)).toList();

      return upcomingMovie;
    } else {
      print("yes");
      throw ServerException();
    }
  }
}
