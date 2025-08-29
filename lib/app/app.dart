import 'package:flutter/material.dart';
import 'package:list_fm/core/theme/app_theme.dart';
import 'package:list_fm/features/search_user/presentation/pages/search_user_page.dart';

class ListFMApp extends StatelessWidget {
  const ListFMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListFM',
      routes: {
        '/': (_) => SearchUserPage(),
      },
      initialRoute: '/',
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      themeMode: ThemeMode.system,
    );
  }
}
