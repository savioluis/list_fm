import 'package:list_fm/core/util/date_time_util.dart';
import 'package:list_fm/features/search_user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.name,
    super.imageUrl,
    super.memberSince,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> currentUser = json['user'];

    final String userName = currentUser['name'];

    final List<dynamic> images = currentUser['image'];

    final String? mediumImageUrl = images.firstWhere(
      (img) => img['size'] == 'medium',
      orElse: () => null,
    )['#text'];

    final memberSinceDateTime = DateTimeUtil.fromUnixTime(currentUser['registered']['#text']);
    final memberSinceString = '${DateTimeUtil.getMonthName(memberSinceDateTime.month)} ${memberSinceDateTime.year}';

    return UserModel(
      name: userName,
      imageUrl: mediumImageUrl,
      memberSince: memberSinceString,
    );
  }
}
