import 'package:movieapp/core/db/mongodb.dart';

import 'package:movieapp/features/movie/data/models/movieModel.dart';

abstract class MovieLocalDataSource {
  Future<void> insertData(List<MovieModel> movieModel, dynamic collectionName);
  Future<List<MovieModel>> getDataFromDB(dynamic collectionname);
}

class MovieLocalDataSourceImpl implements MovieLocalDataSource {
  MovieLocalDataSourceImpl();

  @override
  Future<void> insertData(
      List<MovieModel> movieModel, dynamic collectionName) async {
    var result = await MongoDataBase.insert(movieModel, collectionName);
  }

  Future<List<MovieModel>> getDataFromDB(dynamic collectionname) async {
    final List jsondata = await collectionname.find().toList();
    List<MovieModel> movieModelList =
        jsondata.map<MovieModel>((e) => MovieModel.fromJson(e)).toList();
    return Future.value(movieModelList);
  }
}
