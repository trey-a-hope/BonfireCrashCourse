import 'package:bonfire_crash_course/domain/models/content_builder.dart';
import 'package:bonfire_crash_course/presentation/content/2.installation_content.dart';
import 'package:bonfire_crash_course/presentation/content/1.overview_content.dart';
import 'package:bonfire_crash_course/presentation/content/3.run_app_content.dart';
import 'package:bonfire_crash_course/presentation/content/4.add_player_overview.dart';
import 'package:bonfire_crash_course/presentation/content/5.add_player_lets_code.dart';
import 'package:bonfire_crash_course/presentation/content/6.add_player_demo.dart';
import 'package:flutter/material.dart';

class ContentProvider extends ChangeNotifier {
  // Current position in nav stack.
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  // Return the content for the current page.
  ContentBuilder get contentBuilder => _contentBuilders[_currentIndex];

  // All contents available for the app.
  List<ContentBuilder> get contentBuilders => _contentBuilders;

  // Get the previous content's title.
  String? get previousContentTitle =>
      _currentIndex < 1 ? null : _contentBuilders[_currentIndex - 1].title;

  // Get the next content's title.
  String? get nextContentTitle => _currentIndex == _contentBuilders.length - 1
      ? null
      : _contentBuilders[_currentIndex + 1].title;

  // All contents available for the app.
  final List<ContentBuilder> _contentBuilders = [
    OverviewContent(),
    InstallationContent(),
    RunAppContent(),
    AddPlayerOverview(),
    AddPlayerLetsCode(),
    AddPlayerDemo(),
  ];

  // Update the current index.
  void updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
