import 'package:flutter/material.dart';
import 'colors.dart';
import 'fonts.dart';

class ImdbTextStyles {
  ImdbTextStyles._();

  static const TextStyle title1SfWhiteBold = TextStyle(
    fontFamily: ImdbFonts.sfProDisplay,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: ImdbColors.primaryWhite,
  );

  static const TextStyle heading1SfWhiteBold = TextStyle(
    fontFamily: ImdbFonts.sfProDisplay,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: ImdbColors.primaryWhite,
  );

  static const TextStyle heading2SfWhiteBold = TextStyle(
    fontFamily: ImdbFonts.sfProDisplay,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: ImdbColors.primaryWhite,
  );

  static const TextStyle paragraph1SfWhiteLight = TextStyle(
    fontFamily: ImdbFonts.sfProDisplay,
    fontSize: 11,
    fontWeight: FontWeight.w300,
    color: ImdbColors.primaryWhite,
  );

  static const TextStyle paragraph2SfWhite = TextStyle(
    fontFamily: ImdbFonts.sfProDisplay,
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: ImdbColors.primaryWhite,
  );

  static const TextStyle paragraph3SfWhite = TextStyle(
    fontFamily: ImdbFonts.sfProDisplay,
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: ImdbColors.primaryWhite,
  );
}
