import 'package:flutter/material.dart';

class ImdbPaddings {
  late double screenWidth;
  late double screenHeight;

  ImdbPaddings(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  // Paddings
  static const EdgeInsets horizontal32Padding =
      EdgeInsets.symmetric(horizontal: 32.0);
  static const EdgeInsets horizontal24Padding =
      EdgeInsets.symmetric(horizontal: 24.0);
  static const EdgeInsets horizontal16Padding =
      EdgeInsets.symmetric(horizontal: 16.0);

  static const EdgeInsets vertical32Padding =
      EdgeInsets.symmetric(vertical: 32.0);
  static const EdgeInsets vertical24Padding =
      EdgeInsets.symmetric(vertical: 24.0);
  static const EdgeInsets vertical16Padding =
      EdgeInsets.symmetric(vertical: 16.0);

  // Sized Boxes
  SizedBox extraSmallVerticalSizedBox() =>
      SizedBox(height: screenHeight * 0.02);

  SizedBox smallVerticalSizedBox() => SizedBox(height: screenHeight * 0.04);

  SizedBox mediumVerticalSizedBox() => SizedBox(height: screenHeight * 0.07);

  SizedBox largeVerticalSizedBox() => SizedBox(height: screenHeight * 0.12);

  SizedBox extraLargeVerticalSizedBox() =>
      SizedBox(height: screenHeight * 0.25);

  SizedBox extraSmallHorizontalSizedBox() =>
      SizedBox(width: screenHeight * 0.03);

  SizedBox smallHorizontalSizedBox() => SizedBox(width: screenHeight * 0.04);

  SizedBox mediumHorizontalSizedBox() => SizedBox(width: screenHeight * 0.09);

  SizedBox largeHorizontalSizedBox() => SizedBox(width: screenHeight * 0.3);
}
