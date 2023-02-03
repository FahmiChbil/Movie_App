import 'package:movieapp/features/movie/domain/entities/images.dart';

class ImagessModel extends Imagess {
  ImagessModel(
      {required super.id,
      required super.backdropPath,
      required super.logoPath,
      required super.posterPath});

  factory ImagessModel.fromJson(Map<String, dynamic> json) {
    return ImagessModel(
        id: json['id'],
        backdropPath:
            List<String>.from(json['backdrops'].map((x) => x['file_path'])),
        logoPath: List<String>.from(json['logos'].map((x) => x['file_path'])),
        posterPath: List<String>.from(
          json['posters'].map((x) => x['file_path']),
        ));
  }
}
