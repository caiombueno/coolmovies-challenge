import 'package:equatable/equatable.dart';

class MovieDirector extends Equatable {
  final String directorId;
  final String? name;

  const MovieDirector({
    required this.directorId,
    this.name,
  });

  @override
  List<Object?> get props => [directorId, name];
}
