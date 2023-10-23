import 'package:bonfire_crash_course/domain/abstact_models/content_builder.dart';
import 'package:bonfire_crash_course/domain/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlayerContent extends ContentBuilder {
  AddPlayerContent({super.key})
      : super(
          title: 'Add Player',
          content: _AddPlayerMainContent(),
          sidebarContent: _AddPlayerSidebarContent(),
        );
}

class _AddPlayerMainContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => const Center(
        child: Text('Add Player'),
      );
}

class _AddPlayerSidebarContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var contentProvider = ref.read(Providers.contentProvider);

    return Column(
      children: [
        const Text('Slow down!'),
        const Spacer(),
      ],
    );
  }
}
