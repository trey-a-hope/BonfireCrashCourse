import 'package:bonfire_crash_course/domain/models/content_builder.dart';
import 'package:bonfire_crash_course/presentation/widgets/code_preview_widget.dart';
import 'package:bonfire_crash_course/presentation/widgets/nav_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlayerDemo extends ContentBuilder {
  AddPlayerDemo()
      : super(
          title: 'Demo',
          category: 'Add Player',
          content: _AddPlayerDemoContent(),
          sidebarContent: _AddPlayerDemoSidebarContent(),
        );
}

class _AddPlayerDemoContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        CodePreviewWidget(fileName: 'green_ninja.dart'),
        NavButtonsWidget(),
      ],
    );
  }
}

class _AddPlayerDemoSidebarContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        Text('Coming soon...'),
        Spacer(),
      ],
    );
  }
}
