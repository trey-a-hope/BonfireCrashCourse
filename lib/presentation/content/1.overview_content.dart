import 'package:bonfire_crash_course/domain/models/content_builder.dart';
import 'package:bonfire_crash_course/domain/providers/providers.dart';
import 'package:bonfire_crash_course/presentation/widgets/nav_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class OverviewContent extends ContentBuilder {
  OverviewContent()
      : super(
          title: 'Overview',
          category: 'Getting Started',
          content: _OverviewMainContent(),
          sidebarContent: _OverviewSidebarContent(),
        );
}

class _OverviewMainContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Bonfire Crash Course',
            style: MacosTheme.of(context).typography.largeTitle,
          ),
          Text(
            'Welcome to the beginners course to learning about Flutters RPG maker framework, Bonfire.',
            style: MacosTheme.of(context).typography.body,
          ),
          const NavButtonsWidget(),
        ],
      );
}

class _OverviewSidebarContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var contentProvider = ref.read(Providers.contentProvider);

    return Column(
      children: [
        const Text('Check out the next page.'),
        const Spacer(),
        ElevatedButton(
            onPressed: () {
              contentProvider.updateIndex(contentProvider.currentIndex + 1);
            },
            child: const Text('Next')),
      ],
    );
  }
}
