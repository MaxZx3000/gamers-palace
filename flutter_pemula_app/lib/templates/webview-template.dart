import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class WebviewTemplate extends StatelessWidget {
  final String webViewContent;

  WebviewTemplate({this.webViewContent});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Html(data:
        """${this.webViewContent}""",
        padding: EdgeInsets.all(8.0)
      ),
    );
  }
}
