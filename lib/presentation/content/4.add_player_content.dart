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
  Widget build(BuildContext context, WidgetRef ref) {
    var gameProvider = ref.watch(Providers.gameProvider);

    return Center(
      child: Text('Add Player : ${gameProvider.playerName}'),
    );
  }
}

class _AddPlayerSidebarContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var gameProvider = ref.read(Providers.gameProvider);

    return Column(
      children: [
        const Text('Slow down!'),
        const Spacer(),
        Material(
          child: TextField(
            onChanged: (val) {
              gameProvider.updatePlayerName(val);
            },
          ),
        )
      ],
    );
  }
}
