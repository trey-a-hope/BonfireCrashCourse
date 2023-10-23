import 'package:bonfire_crash_course/domain/content/2_installation_content.dart';
import 'package:bonfire_crash_course/domain/content/1_overview_content.dart';
import 'package:bonfire_crash_course/domain/abstact_models/content_builder.dart';
import 'package:bonfire_crash_course/domain/content/3_run_app_content.dart';
import 'package:bonfire_crash_course/domain/content/4_add_player_content.dart';
import 'package:flutter/material.dart';

class ContentProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  ContentBuilder get content => _contents[_currentIndex];

  ContentProvider();

  final List<ContentBuilder> _contents = [
    OverviewContent(),
    InstallationContent(),
    RunAppContent(),
    AddPlayerContent(),
  ];

  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
