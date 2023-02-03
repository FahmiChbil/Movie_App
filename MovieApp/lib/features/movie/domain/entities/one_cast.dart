import 'package:equatable/equatable.dart';

class Cast extends Equatable {
  final int id;
  final String name;
  final String image;

  Cast({required this.image, required this.id, required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image];
}
