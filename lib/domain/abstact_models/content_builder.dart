import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class ContentBuilder extends ConsumerWidget {
  final String title;
  final ConsumerWidget content;
  final ConsumerWidget sidebarContent;

  const ContentBuilder(
      {super.key,
      required this.title,
      required this.content,
      required this.sidebarContent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ContentPageWidget(content: this);
  }
}

class ContentPageWidget extends StatelessWidget {
  final ContentBuilder content;

  const ContentPageWidget({
    super.key,
    required this.content,
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
            title: Text(content.title),
            titleWidth: MediaQuery.of(context).size.width / 2,
          ),
          children: [
            ContentArea(
              builder: (context, scrollController) => content.content,
            ),
          ],
        );
      },
    );
  }
}
