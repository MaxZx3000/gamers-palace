import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';

class BasicButtonTemplate extends StatelessWidget {
  void onPressedOperation = () {};
  String text;

  BasicButtonTemplate(this.onPressedOperation, this.text);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => onPressedOperation,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              gradient: CustomGradient.getCommonGradient()),
          child: Text(this.text),
        ));
  }
}
