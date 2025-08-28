import 'package:flutter/material.dart';
import 'package:list_fm/features/home/presentation/home_page.dart';
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
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
