import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/globals/colors.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';

class StylizedCardTemplate extends StatelessWidget {
  final String title;
  final Icon icon;
  final Widget contentWidget;
  final double height;

  StylizedCardTemplate(
      {this.icon, this.title, this.contentWidget, this.height});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: Border(
            bottom:
                BorderSide(width: 2, color: Color(CUSTOM_COLORS["darkViolet"])),
            left:
                BorderSide(width: 2, color: Color(CUSTOM_COLORS["darkViolet"])),
            right:
                BorderSide(width: 2, color: Color(CUSTOM_COLORS["darkRed"]))),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(gradient: CustomGradient.getCommonGradient()),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: icon,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontFamily: 'Poppins', color: Colors.white),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Container(
                  height: this.height,
                  width: IntrinsicWidth(
                    child: contentWidget,
                  ).stepWidth,
                  child: contentWidget,
                ),
              ),
            ),
          ],
        ));
  }
}
