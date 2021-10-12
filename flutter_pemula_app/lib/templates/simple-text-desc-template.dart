import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';
import 'package:flutter_pemula_app/templates/simple-container-template.dart';

class SimpleTextDescTemplate extends StatelessWidget {
  final String title;
  final Icon icon;
  final String miniDesc;

  SimpleTextDescTemplate({this.title, this.icon, this.miniDesc});

  Widget build(BuildContext buildContext) {
    return Column(children: [
      SimpleContainerTemplate(
        width: 175,
        bodyWidget: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        radius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      ),
      SimpleContainerTemplate(
        width: 175,
        customGradient: CustomGradient.getDarkBlueGradient(),
        radius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
        bodyWidget: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: icon),
            Text(miniDesc, style: TextStyle(color: Colors.white))
          ],
        ),
      )
    ]);
  }
}
