// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:list_fm/core/theme/color/color_extension.dart';
import 'package:list_fm/core/theme/theme_extension.dart';

class ListFMTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isEnabled;
  final InputDecoration? decoration;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;

  const ListFMTextField({
    this.controller,
    this.hintText,
    this.isEnabled = true,
    this.decoration,
    this.maxLines = 1,
    this.contentPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final textFieldTheme = context.textFieldTheme;
    return TextFormField(
      enabled: isEnabled,
      controller: controller,
      maxLines: maxLines,
      decoration:
          decoration ??
          InputDecoration(
            hintText: hintText,
            hintStyle: textTheme.bodyLarge!.copyWith(color: context.lightGreyColor.withOpacity(0.7)),
            contentPadding: contentPadding ?? textFieldTheme.contentPadding,
            filled: textFieldTheme.filled,
            fillColor: textFieldTheme.fillColor,
            labelStyle: textFieldTheme.labelStyle,
            floatingLabelStyle: textFieldTheme.floatingLabelStyle,
            enabledBorder: textFieldTheme.enabledBorder,
            focusedBorder: textFieldTheme.focusedBorder,
            errorBorder: textFieldTheme.errorBorder,
            focusedErrorBorder: textFieldTheme.focusedErrorBorder,
          ),

      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
