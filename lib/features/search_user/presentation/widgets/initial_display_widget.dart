import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:list_fm/core/theme/color/color_extension.dart';
import 'package:list_fm/core/theme/theme_extension.dart';

class InitialDisplayWidget extends StatelessWidget {
  const InitialDisplayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          HugeIcons.strokeRoundedMusicNote01,
          size: 56,
          color: context.secondaryColor,
        ),
        Text(
          'Comece sua jornada musical',
          textAlign: TextAlign.center,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        Text(
          'Busque por usuários e descubra novos sons',
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.greyColor,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}