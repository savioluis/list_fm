import 'package:flutter/material.dart';
import 'package:list_fm/core/theme/color/color_extension.dart';
import 'package:list_fm/core/theme/theme_extension.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    this.height = 180,
    super.key,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.surfaceColor,
      child: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Encontre e acompanhe perfis no ',
                      style: context.textTheme.displayLarge?.copyWith(
                        color: context.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 48,
                      ),
                    ),
                    TextSpan(
                      text: 'Last.fm',
                      style: context.textTheme.displayLarge?.copyWith(
                        color: context.secondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 48,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                '🚀 Veja o que escutam e descubra novas músicas',
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(200);
}
