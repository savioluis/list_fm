import 'package:flutter/material.dart';
import 'package:list_fm/app/app.dart';
import 'package:list_fm/injections.dart';

void main() async {
  await setupDependencies();
  runApp(const ListFMApp());
}
