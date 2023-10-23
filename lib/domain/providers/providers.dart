import 'package:bonfire_crash_course/domain/providers/content_provider.dart';
import 'package:bonfire_crash_course/domain/providers/game_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Providers {
  static final contentProvider = ChangeNotifierProvider(
    (_) => ContentProvider(),
  );

  static final gameProvider = ChangeNotifierProvider(
    (_) => GameProvider(),
  );
}
