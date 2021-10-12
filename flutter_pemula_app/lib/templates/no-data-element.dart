import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';

class NoDataElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          gradient: CustomGradient.getSecondaryGradient()),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.gamepad,
                color: Colors.white,
              ),
            ),
            Text(
              "No Data",
              style: TextStyle(color: Colors.white),
            )
          ]),
    );
  }
}
