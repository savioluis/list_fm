import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? imageUrl;
  final String? memberSince;

  const UserEntity({
    this.name,
    this.imageUrl,
    this.memberSince,
  });

  @override
  List<Object?> get props => [
    name,
    imageUrl,
    memberSince,
  ];
}
