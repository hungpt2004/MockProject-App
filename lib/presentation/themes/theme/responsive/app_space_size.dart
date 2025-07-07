import 'package:flutter/cupertino.dart';

class AppSpaceSize {
  static spaceHeightApp(double height){
    return SizedBox(
      height: height,
    );
  }
  static spaceWidthApp(double width){
    return SizedBox(
      width: width,
    );
  }
}

class HeightSpacing {
  static Widget heightSpacing(double height) => SizedBox(height: height,);
}

class WidthSpacing {
  static Widget widthSpacing(double width) => SizedBox(width: width,);
}