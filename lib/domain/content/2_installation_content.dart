import 'package:bonfire_crash_course/domain/abstact_models/content_builder.dart';
import 'package:bonfire_crash_course/domain/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InstallationContent extends ContentBuilder {
  InstallationContent({super.key})
      : super(
          title: 'Installation',
          content: _InstallationMainContent(),
          sidebarContent: _InstallationSidebarContent(),
        );
}

class _InstallationMainContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => const Center(
        child: Text('Installation'),
      );
}

class _InstallationSidebarContent extends ConsumerWidget {
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
