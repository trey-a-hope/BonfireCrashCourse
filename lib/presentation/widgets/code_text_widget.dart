import 'package:flutter/material.dart';
import 'package:flutter_highlighter/flutter_highlighter.dart';
import 'package:flutter_highlighter/themes/github.dart';

class CodeTextWidget extends StatefulWidget {
  final String code;

  const CodeTextWidget({
    Key? key,
    required this.code,
  }) : super(key: key);

  @override
  State<CodeTextWidget> createState() => _CodeTextWidgetState();
}

class _CodeTextWidgetState extends State<CodeTextWidget> {
  String _input = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Enter the code to specify a size for the player.'),
        HighlightView(
          // The original code to be highlighted
          widget.code.replaceRange(10, 10, _input),

          // Specify language
          // It is recommended to give it a value for performance
          language: 'dart',

          // Specify highlight theme
          // All available themes are listed in `themes` folder
          theme: githubTheme,

          // Specify padding
          padding: const EdgeInsets.all(12),

          // Specify text style
          textStyle: const TextStyle(
            fontFamily: 'My awesome monospace font',
            fontSize: 16,
          ),
        ),
        Material(
          child: TextField(
            decoration: InputDecoration(
                suffix: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => {},
            )),
            onChanged: (val) => setState(() => _input = val),
          ),
        )
      ],
    );
  }
}
