import 'package:bonfire_crash_course/domain/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';

class NavButtonsWidget extends ConsumerWidget {
  const NavButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var contentProvider = ref.read(Providers.contentProvider);

    var currentIndex = contentProvider.currentIndex;
    var prev = contentProvider.previousContentTitle;
    var next = contentProvider.nextContentTitle;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (prev != null) ...[
            PushButton(
              onPressed: () => contentProvider.updateIndex(currentIndex - 1),
              controlSize: ControlSize.large,
              child: Text('Prev: $prev'),
            ),
          ],
          if (next != null) ...[
            PushButton(
              onPressed: () => contentProvider.updateIndex(currentIndex + 1),
              controlSize: ControlSize.large,
              child: Text('Next: $next'),
            ),
          ]
        ],
      ),
    );
  }
}
