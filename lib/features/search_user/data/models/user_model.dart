import 'package:list_fm/features/search_user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.name,
    super.imageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> currentUser = json['user'];

    final List<dynamic> images = currentUser['image'];

    final String? mediumImageUrl = images.firstWhere(
      (img) => img['size'] == 'medium',
      orElse: () => null,
    )['#text'];

    return UserModel(
      name: currentUser['name'],
      imageUrl: mediumImageUrl,
    );
  }
}
