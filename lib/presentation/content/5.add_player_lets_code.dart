import 'package:bonfire_crash_course/domain/models/content_builder.dart';
import 'package:bonfire_crash_course/presentation/widgets/nav_buttons_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlayerLetsCode extends ContentBuilder {
  AddPlayerLetsCode()
      : super(
          title: 'Let\'s Code',
          category: 'Add Player',
          content: _AddPlayerLetsCodeContent(),
          sidebarContent: _AddPlayerLetsCodeSidebarContent(),
        );
}

class _AddPlayerLetsCodeContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        Text('Let\'s Code.'),
        NavButtonsWidget(),
      ],
    );
  }
}

class _AddPlayerLetsCodeSidebarContent extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        Text('Let\'s Code.'),
        Spacer(),
      ],
    );
  }
}
