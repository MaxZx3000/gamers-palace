import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';

class JumbotronTemplate extends StatelessWidget {
  final String title;
  final String backgroundImage;

  JumbotronTemplate(this.title, this.backgroundImage);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomLeft, children: [
      Image.network(
        backgroundImage,
        width: double.infinity,
        height: 250,
        fit: BoxFit.cover,
      ),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: CustomGradient.getWhiteGradient()),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
            left: 15.0,
            right: 5.0
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Poppins',
              color: Colors.white
            ),
          ),
        ),
      ),
    ]);
  }
}
