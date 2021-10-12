import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';

class CustomAppBar {
  static AppBar getAppBar() {
    return AppBar(
        flexibleSpace: Container(
            decoration:
                BoxDecoration(gradient: CustomGradient.getCommonGradient())));
  }
}
