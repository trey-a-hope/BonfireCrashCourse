import 'package:bonfire_crash_course/constants/sprite_sheets.dart';
import 'package:bonfire_crash_course/games/bonfire_crash_course.dart';
import 'package:flutter/material.dart';

BonfireCrashCourse _bonfireCrashCourse = const BonfireCrashCourse();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Pre-load sprite sheets.
  await SpriteSheets.load();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _bonfireCrashCourse,
    ),
  );
}
