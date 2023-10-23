import 'package:bonfire_crash_course/domain/providers/providers.dart';
import 'package:bonfire_crash_course/presentation/games/bonfire_crash_course.dart';
import 'package:bonfire_crash_course/domain/abstact_models/content_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

//TODO: https://firebase.flutter.dev/docs/overview

BonfireCrashCourse _bonfireCrashCourse = const BonfireCrashCourse();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Pre-load sprite sheets.
  // await SpriteSheets.load();
  await _configureMacosWindowUtils();
  runApp(const App());
}

/// This method initializes macos_window_utils and styles the window.
Future<void> _configureMacosWindowUtils() async {
  const config = MacosWindowUtilsConfig();
  await config.apply();
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
          home: const MainView(),
          debugShowCheckedModeBanner: false,
        ),
      );
}

class MainView extends ConsumerWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var contentProvider = ref.watch(Providers.contentProvider);

    return PlatformMenuBar(
      menus: const [
        PlatformMenu(
          label: 'Test',
          menus: [
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.about,
            ),
            PlatformProvidedMenuItem(
              type: PlatformProvidedMenuItemType.quit,
            ),
          ],
        ),
      ],
      child: MacosWindow(
        sidebar: Sidebar(
          minWidth: 200,
          builder: (context, scrollController) => SidebarItems(
            currentIndex: contentProvider.currentIndex,
            onChanged: (index) => contentProvider.updateIndex(index),
            items: const [
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.home),
                label: Text('Getting Started'),
                disclosureItems: [
                  SidebarItem(label: Text('Overview')),
                  SidebarItem(label: Text('Installation')),
                  SidebarItem(label: Text('Run App')),
                ],
              ),
              SidebarItem(
                leading: MacosIcon(CupertinoIcons.person),
                label: Text('Add a Player'),
                disclosureItems: [
                  SidebarItem(label: Text('The Component')),
                ],
              ),
            ],
          ),
        ),
        endSidebar: Sidebar(
          minWidth: 200,
          builder: (context, scrollController) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: contentProvider.content.sidebarContent,
          ),
        ),
        child: ContentPageWidget(
          content: contentProvider.content,
        ),
      ),
    );
  }
}
