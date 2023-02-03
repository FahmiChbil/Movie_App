import 'package:movieapp/features/movie/domain/entities/one_cast.dart';

class CastModel extends Cast {
  CastModel({required super.image, required super.id, required super.name});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
        image: json['profile_path'], id: json['id'], name: json['name']);
  }
}
