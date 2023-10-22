import 'package:flutter/material.dart';

class BCCWrapper {
  final String title;
  final Widget content;
  final List<Widget> sidebarContent;

  BCCWrapper({
    required this.title,
    required this.content,
    required this.sidebarContent,
  });
}
