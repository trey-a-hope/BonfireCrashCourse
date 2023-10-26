import 'package:flutter/material.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

class CodePreviewWidget extends StatelessWidget {
  final String fileName;

  const CodePreviewWidget({
    Key? key,
    required this.fileName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1000,
      child: WidgetWithCodeView(
        filePath: 'lib/main.dart',
        showLabelText: true,
        headerWidget: const Text('green_ninja.dart'),
        codeLinkPrefix:
            'https://github.com/trey-a-hope/bonfire-crash-course/blob/main/lib/main.dart',
        child: Container(
          height: 1000,
          color: Colors.green,
          child: const Center(
            child: Text('Content Goes Here'),
          ),
        ),
      ),
    );
  }
}
