import 'package:bonfire_crash_course/domain/models/content_builder.dart';
import 'package:bonfire_crash_course/presentation/games/bonfire_crash_course.dart';
import 'package:bonfire_crash_course/presentation/widgets/nav_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class RunAppContent extends ContentBuilder {
  RunAppContent()
      : super(
          title: 'Run App',
          category: 'Getting Started',
          content: _RunAppMainContent(),
          sidebarContent: _RunAppSidebarContent(),
        );
}

class _RunAppMainContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Start Debugging',
          style: MacosTheme.of(context).typography.largeTitle,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'With the application open in VSCode, select the green arrow to start debugging the app.',
            style: MacosTheme.of(context).typography.title3,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'You should now see the application running in your window.',
            style: MacosTheme.of(context).typography.title3,
          ),
        ),
        const SizedBox(
          height: 1000,
          child: BonfireCrashCourse(),
        ),
        const NavButtonsWidget(),
      ],
    );
  }
}

class _RunAppSidebarContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        Text('You got pretty far already!'),
        Spacer(),
      ],
    );
  }
}
