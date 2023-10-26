import 'package:bonfire_crash_course/domain/models/content_builder.dart';
import 'package:bonfire_crash_course/domain/providers/providers.dart';
import 'package:bonfire_crash_course/presentation/widgets/nav_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlayerOverview extends ContentBuilder {
  AddPlayerOverview()
      : super(
          title: 'Overview',
          category: 'Add Player',
          content: _AddPlayerMainContent(),
          sidebarContent: _AddPlayerSidebarContent(),
        );
}

class _AddPlayerMainContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        Text('Overview'),
        NavButtonsWidget(),
      ],
    );
  }
}

class _AddPlayerSidebarContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var gameProvider = ref.read(Providers.gameProvider);

    return const Column(
      children: [
        Text('Slow down!'),
        Spacer(),
      ],
    );
  }
}
