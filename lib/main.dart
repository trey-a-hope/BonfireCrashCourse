import 'package:bonfire_crash_course/domain/abstact_models/content_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

//TODO: https://firebase.flutter.dev/docs/overview

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// This method initializes macos_window_utils and styles the window.
  await const MacosWindowUtilsConfig().apply();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: MacosApp(
          title: 'Bonfire Crash Course',
          theme: MacosThemeData.light(),
          darkTheme: MacosThemeData.dark(),
          themeMode: ThemeMode.system,
          home: const ContentPageWidget(),
          debugShowCheckedModeBanner: false,
        ),
      );
}
