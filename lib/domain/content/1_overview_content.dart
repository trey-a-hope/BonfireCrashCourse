import 'package:bonfire_crash_course/domain/abstact_models/content_builder.dart';
import 'package:bonfire_crash_course/domain/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OverviewContent extends ContentBuilder {
  OverviewContent({super.key})
      : super(
          title: 'Overview',
          content: _OverviewMainContent(),
          sidebarContent: _OverviewSidebarContent(),
        );
}

class _OverviewMainContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => const Center(
        child: Text('Home'),
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
