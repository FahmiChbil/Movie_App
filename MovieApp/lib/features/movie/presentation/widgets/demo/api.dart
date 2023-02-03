import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../../../../../core/errors/exceptions.dart';
import '../../../data/models/movie_detail.dart';

class Api {
  Future<MovieDetailModel> getmMovieDetail() async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/35?api_key=0d081622bde5c6ebc71db7cf689f3c65'));

    if (response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      MovieDetailModel movieDetailModel =
          MovieDetailModel.fromJson(decodedJson);
      return movieDetailModel;
    } else {
      throw ServerException();
    }
  }
}
