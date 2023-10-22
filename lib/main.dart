import 'package:bonfire_crash_course/games/bonfire_crash_course.dart';
import 'package:bonfire_crash_course/widgets/bcc_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MacosApp(
      title: 'test',
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),
      themeMode: ThemeMode.system,
      home: const MainView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _pageIndex = 0;

  final List<BCCWrapper> _wrappers = [
    BCCWrapper(
      title: 'Overview',
      content: const Center(
        child: Text('Home'),
      ),
      sidebarContent: [
        Text('Hello there!'),
        Spacer(),
        Text('ok!'),
      ],
    ),
    BCCWrapper(
      title: 'Installation',
      content: const Center(
        child: Text('Installation'),
      ),
      sidebarContent: [
        Text('Thats right!'),
        Spacer(),
        Text('now we can move on!!'),
      ],
    ),
    BCCWrapper(
      title: 'Run App',
      content: const Center(
        child: Text('Run App'),
      ),
      sidebarContent: [
        Text('Thats right!'),
        Spacer(),
        Text('now we can move on!!'),
      ],
    ),
    BCCWrapper(
      title: 'Add a Player : The Component',
      content: const Center(
        child: Text('The Component =)'),
      ),
      sidebarContent: [
        Text('Thats right!'),
        Spacer(),
        Text('now we can move on!!'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
            currentIndex: _pageIndex,
            onChanged: (index) {
              setState(() => _pageIndex = index);
            },
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
                leading: MacosIcon(CupertinoIcons.home),
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
          builder: (context, scrollController) => const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                    'The method seekPlayer lets the enemy know to start following our main character.'),
                Spacer(),
                // TextField()
              ],
            ),
          ),
        ),
        child: IndexedStack(
          index: _pageIndex,
          children: [
            ContentPageWidget(wrapper: _wrappers[0]),
            ContentPageWidget(wrapper: _wrappers[1]),
            ContentPageWidget(wrapper: _wrappers[2]),
            ContentPageWidget(wrapper: _wrappers[3]),
          ],
        ),
      ),
    );
  }
}

class ContentPageWidget extends StatelessWidget {
  final BCCWrapper wrapper;

  const ContentPageWidget({
    super.key,
    required this.wrapper,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MacosScaffold(
          toolBar: ToolBar(
            leading: MacosTooltip(
              message: 'Toggle Sidebar',
              useMousePosition: false,
              child: MacosIconButton(
                icon: MacosIcon(
                  CupertinoIcons.sidebar_left,
                  color: MacosTheme.brightnessOf(context).resolve(
                    const Color.fromRGBO(0, 0, 0, 0.5),
                    const Color.fromRGBO(255, 255, 255, 0.5),
                  ),
                  size: 20.0,
                ),
                boxConstraints: const BoxConstraints(
                  minHeight: 20,
                  minWidth: 20,
                  maxWidth: 48,
                  maxHeight: 38,
                ),
                onPressed: () => MacosWindowScope.of(context).toggleSidebar(),
              ),
            ),
            actions: [
              ToolBarIconButton(
                label: 'Info',
                tooltipMessage: 'Open for more details.',
                icon: const MacosIcon(
                  CupertinoIcons.info,
                ),
                onPressed: () =>
                    MacosWindowScope.of(context).toggleEndSidebar(),
                showLabel: true,
              ),
            ],
            title: Text(wrapper.title),
            titleWidth: MediaQuery.of(context).size.width / 2,
          ),
          children: [
            ContentArea(
              builder: (context, scrollController) => wrapper.content,
            ),
          ],
        );
      },
    );
  }
}
