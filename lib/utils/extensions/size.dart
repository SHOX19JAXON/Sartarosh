import 'package:flutter/cupertino.dart';

double height = 0.0;
double width = 0.0;

extension Size on int {
  double get h {
    return (this / 852) * height;
  }

  double get w {
    return (this / 393) * width;
  }

  SizedBox getH() {
    return SizedBox(
      height: (this / 852) * height,
    );
  }

  SizedBox getW() {
    return SizedBox(
      width: (this / 393) * width,
    );
  }
}
