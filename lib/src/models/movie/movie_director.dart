import 'package:equatable/equatable.dart';

typedef DirectorID = String;

class MovieDirector extends Equatable {
  final DirectorID directorId;
  final String? name;

  const MovieDirector({
    required this.directorId,
    this.name,
  });

  @override
  List<Object?> get props => [directorId, name];
}
