import 'package:flutter/material.dart';
import 'package:flutter_pemula_app/globals/colors.dart';

class CustomGradient {
  static LinearGradient getCommonGradient() {
    return LinearGradient(colors: [
      Color(CUSTOM_COLORS['darkViolet']),
      Color(CUSTOM_COLORS['darkRed'])
    ]);
  }

  static LinearGradient getSecondaryGradient() {
    return LinearGradient(
        colors: [Color(CUSTOM_COLORS['darkRed']), Color(CUSTOM_COLORS['red'])]);
  }

  static LinearGradient getWhiteGradient() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.transparent, Colors.white]);
  }

  static LinearGradient getDarkBlueGradient() {
    return LinearGradient(colors: [
      Color(CUSTOM_COLORS["darkBlue"]),
      Color(CUSTOM_COLORS["darkViolet"])
    ]);
  }

  static LinearGradient getCoolBlackGradient() {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(CUSTOM_COLORS["darkGray"]), Colors.black]);
  }
}
