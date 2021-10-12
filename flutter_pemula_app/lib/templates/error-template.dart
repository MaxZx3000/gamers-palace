import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/globals/colors.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';

class ErrorTemplate extends StatelessWidget {
  final String errorMessage;

  ErrorTemplate({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            child: Icon(Icons.error,
                size: 60, color: Color(CUSTOM_COLORS["darkRed"])),
          ),
          Container(
            padding: EdgeInsets.all(3.0),
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                gradient: CustomGradient.getSecondaryGradient()),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(10.0),
              child: Text(errorMessage),
            ),
          )
        ],
      ),
    );
  }
}
