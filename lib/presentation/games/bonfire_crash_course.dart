import 'package:bonfire/bonfire.dart';
import 'package:bonfire_crash_course/data/constants/globals.dart';
import 'package:flutter/material.dart';

class BonfireCrashCourse extends StatefulWidget {
  const BonfireCrashCourse({Key? key}) : super(key: key);

  @override
  State<BonfireCrashCourse> createState() => _BonfireCrashCourseState();
}

class _BonfireCrashCourseState extends State<BonfireCrashCourse> {
  @override
  Widget build(BuildContext context) => BonfireWidget(
        map: WorldMapByTiled(
          Globals.lv_1_1,
        ),
      );
}
