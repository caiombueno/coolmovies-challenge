import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String userId;
  final String? name;

  const User({required this.userId, this.name});

  @override
  List<Object?> get props => [userId, name];
}
