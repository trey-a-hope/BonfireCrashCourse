import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContentBuilder {
  final String title;
  final String category;
  final ConsumerWidget content;
  final ConsumerWidget sidebarContent;

  const ContentBuilder({
    required this.title,
    required this.category,
    required this.content,
    required this.sidebarContent,
  });
}
