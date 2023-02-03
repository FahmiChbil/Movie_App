import 'dart:convert';

import '../features/movie/data/models/movieModel.dart';
import 'package:http/http.dart' as http;

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

    yield* Stream.value(popularMovie);
  }
}
