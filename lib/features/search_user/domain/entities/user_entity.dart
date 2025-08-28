import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? imageUrl;

  const UserEntity({
    this.name,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [
    name,
    imageUrl,
  ];
}
