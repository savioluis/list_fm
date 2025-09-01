// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:list_fm/core/theme/color/color_extension.dart';
import 'package:list_fm/core/theme/theme_extension.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    required this.name,
    required this.imageUrl,
    required this.registeredDate,
    this.imageSize = 64,
    this.onPressed,
    super.key,
  });

  final String? imageUrl;
  final String? name;
  final String? registeredDate;
  final double imageSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(24),
      elevation: 0.4,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(24),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: context.primaryColor.withOpacity(0.1),
              width: 1.2,
            ),
            color: context.surfaceColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipOval(
                child: imageUrl != null && imageUrl != ''
                    ? CachedNetworkImage(
                        imageUrl: imageUrl!,
                        width: imageSize,
                        height: imageSize,
                        fit: BoxFit.cover,
                        fadeInDuration: const Duration(milliseconds: 1200),
                        fadeOutDuration: const Duration(milliseconds: 800),
                        placeholderFadeInDuration: const Duration(milliseconds: 800),
                        placeholder: (context, url) => Container(
                          width: imageSize,
                          height: imageSize,
                          color: context.lightGreyColor.withOpacity(0.18),
                          child: Center(
                            child: SizedBox(
                              width: 1 / 4 * imageSize,
                              height: 1 / 4 * imageSize,
                              child: CircularProgressIndicator(
                                strokeWidth: 1,
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: imageSize,
                          height: imageSize,
                          color: context.lightGreyColor.withOpacity(0.18),
                          child: Icon(
                            HugeIcons.strokeRoundedAlert02,
                            color: context.errorColor,
                            size: 9 / 16 * imageSize,
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Container(
                          width: imageSize,
                          height: imageSize,
                          color: context.lightGreyColor.withOpacity(0.18),
                          child: Icon(
                            HugeIcons.strokeRoundedImageNotFound02,
                            color: context.primaryColor,
                            size: 9 / 16 * imageSize,
                          ),
                        ),
                      ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? '',
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontSize: 16,
                        color: context.primaryColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ?registeredDate != null
                        ? Text(
                            'desde $registeredDate',
                            style: context.textTheme.bodyLarge?.copyWith(
                              fontSize: 12,
                              color: context.lightGreyColor,
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        : null,
                  ],
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right_sharp,
                color: context.secondaryColor,
                weight: 10,
                grade: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
