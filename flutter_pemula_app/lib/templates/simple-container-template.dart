import 'package:flutter/cupertino.dart';
import 'package:flutter_pemula_app/globals/gradient.dart';

class SimpleContainerTemplate extends StatelessWidget {
  final Widget bodyWidget;
  EdgeInsets containerPadding;
  final double width;
  LinearGradient customGradient;
  BorderRadius radius;

  SimpleContainerTemplate(
      {this.bodyWidget,
      this.radius,
      this.width,
      this.customGradient,
      this.containerPadding}) {
    if (this.containerPadding == null) {
      this.containerPadding = EdgeInsets.all(8.0);
    }
    if (this.radius == null) {
      this.radius = BorderRadius.zero;
    }
    if (this.customGradient == null) {
      this.customGradient = CustomGradient.getSecondaryGradient();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: Container(
          width: width,
          padding: this.containerPadding,
          decoration: BoxDecoration(gradient: this.customGradient),
          child: bodyWidget),
    );
  }
}
