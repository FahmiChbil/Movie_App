import 'package:equatable/equatable.dart';

class Imagess extends Equatable {
  final int id;
  final List<String> backdropPath;
  final List<String> logoPath;
  final List<String> posterPath;

  Imagess(
      {required this.id,
      required this.backdropPath,
      required this.logoPath,
      required this.posterPath});

  @override
  // TODO: implement props
  List<Object?> get props => [id, backdropPath, logoPath, posterPath];
}
