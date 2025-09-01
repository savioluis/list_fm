import 'package:flutter/material.dart';
import 'package:list_fm/core/theme/color/color_extension.dart';
import 'package:list_fm/core/theme/theme_extension.dart';

class NotFoundDisplayWidget extends StatelessWidget {
  const NotFoundDisplayWidget({
    required this.isCentered,
    super.key,
  });

  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    final title = 'Usuário não encontrado';
    final subtitle = 'Verifique o nome digitado e tente novamente';
    return isCentered
        ? Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                color: context.secondaryColor,
                size: 72,
              ),
              Text(
                title,
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                subtitle,
                style: context.textTheme.bodySmall?.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off,
                color: context.secondaryColor,
                size: 36,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: context.textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: context.textTheme.bodySmall?.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
