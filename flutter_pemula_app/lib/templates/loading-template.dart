import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/globals/colors.dart';

class LoadingTemplate extends StatefulWidget {
  final String message;

  LoadingTemplate(this.message);

  @override
  State<StatefulWidget> createState() => _LoadingTemplateState(message);
}

class _LoadingTemplateState extends State<LoadingTemplate>
    with SingleTickerProviderStateMixin {
  final String message;

  _LoadingTemplateState(this.message);

  AnimationController controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat(reverse: true);
        }
      });
    _animation = CurvedAnimation(parent: controller, curve: Curves.ease);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [
                Color(CUSTOM_COLORS['darkRed']),
                Color(CUSTOM_COLORS['darkBlue'])
              ])),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FadeTransition(
              opacity: _animation,
              child: Icon(Icons.gamepad_rounded,
                  size: 40, color: Color(CUSTOM_COLORS["red"])),
            ),
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(message),
        )
      ],
    );
  }
}
