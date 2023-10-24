import 'package:bonfire_crash_course/domain/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class ContentPageWidget extends ConsumerWidget {
  const ContentPageWidget({
    super.key,
  });

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
              type: PlatformProvidedMenuItemType.zoomWindow,
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
            items: [
              SidebarItem(
                leading: const MacosIcon(CupertinoIcons.home),
                label: const Text('Getting Started'),
                disclosureItems: [
                  for (var c in contentProvider.contentBuilders
                      .where((e) => e.category == 'Getting Started')) ...[
                    SidebarItem(label: Text(c.title)),
                  ]
                ],
              ),
              SidebarItem(
                leading: const MacosIcon(CupertinoIcons.person),
                label: const Text('Add Player'),
                disclosureItems: [
                  for (var c in contentProvider.contentBuilders
                      .where((e) => e.category == 'Add Player')) ...[
                    SidebarItem(label: Text(c.title)),
                  ]
                ],
              ),
            ],
          ),
        ),
        endSidebar: Sidebar(
          minWidth: 200,
          builder: (context, scrollController) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: contentProvider.contentBuilder.sidebarContent,
          ),
        ),
        child: Builder(
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
                    onPressed: () =>
                        MacosWindowScope.of(context).toggleSidebar(),
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
                title: Text(
                    '${contentProvider.contentBuilder.category} - ${contentProvider.contentBuilder.title}'),
                titleWidth: MediaQuery.of(context).size.width / 2,
              ),
              children: [
                ContentArea(
                  builder: (context, scrollController) => SingleChildScrollView(
                    controller: scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: contentProvider.contentBuilder.content,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
