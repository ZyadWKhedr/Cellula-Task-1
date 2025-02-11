import 'package:flutter/material.dart';

class Dimensions {
  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  // predefined dimensions based on screen height
  static double height10(BuildContext context) => screenHeight(context) / 80;
  static double height20(BuildContext context) => screenHeight(context) / 40;
  static double height50(BuildContext context) => screenHeight(context) / 16;

  //predefined dimensions based on screen width
  static double width10(BuildContext context) => screenWidth(context) / 80;
  static double width20(BuildContext context) => screenWidth(context) / 40;
  static double width50(BuildContext context) => screenWidth(context) / 16;
}
