import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:movieapp/core/db/db_setup.dart';
import 'package:movieapp/features/movie/data/models/movieModel.dart';

class MongoDataBase {
  static var db, nowPlayingCollection, popularCollection, topratedCollection;
  static connect() async {
    db = await Db.create(MONGO_URL);
    await db.open();
    inspect(db);
    nowPlayingCollection = await db.collection(NOW_PLAYING);
    popularCollection = await db.collection(POPULAR);
    topratedCollection = await db.collection(TOP_RATED);
  }

  static Future<String> insert(
      List<MovieModel> movieModel, dynamic collectionName) async {
    try {
      final List<Map<String, dynamic>> listofmap =
          movieModel.map((e) => e.toJson()).toList();
      var result = await collectionName.insertMany(listofmap);
      return "success mongo";
    } catch (e) {
      return e.toString();
    }
  }

  static Future<String> insertStreamData(
      List<MovieModel> movieModel, dynamic collectionName) async {
    try {
      final List<Map<String, dynamic>> listofmap =
          movieModel.map((e) => e.toJson()).toList();
      var result = await collectionName.insertMany(listofmap);
      return "success mongo";
    } catch (e) {
      return e.toString();
    }
  }
}
