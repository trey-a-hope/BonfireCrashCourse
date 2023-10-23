import 'package:bonfire_crash_course/domain/abstact_models/content_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RunAppContent extends ContentBuilder {
  RunAppContent({super.key})
      : super(
          title: 'Run App',
          content: _RunAppMainContent(),
          sidebarContent: _RunAppSidebarContent(),
        );
}

class _RunAppMainContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
      child: Text('Run App'),
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
