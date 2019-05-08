
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:share_your_christmas/utils/fontUtil.dart';
import 'package:share_your_christmas/utils/screenUtil.dart';

final TextStyle textStyleLabel = TextStyle(
  fontFamily: SEGOEPR_FONT,
  color: Colors.white,
  fontSize: ScreenUtil.getInstance().cvFontSize(35),
  decoration: TextDecoration.none,
);

final TextStyle textStyleLabelUnderline = TextStyle(
  fontFamily: SEGOEPR_FONT,
  color: Colors.white,
  fontSize: ScreenUtil.getInstance().cvFontSize(35),
  decoration: TextDecoration.underline,
  decorationColor: Colors.yellow,
);
Color textFieldColor = const Color.fromRGBO(255, 255, 255, 1);

Color primaryColor = const Color(0xFF00c497);

TextStyle buttonTextStyle = const TextStyle(
    color: const Color.fromRGBO(255, 255, 255, 0.8),
    fontSize: 14.0,
    fontFamily: "Roboto",
    fontWeight: FontWeight.bold);

TextStyle textStyle = const TextStyle(
    color: const Color(0xffca0000),
    decoration: TextDecoration.none,
    fontSize: 16.0,
    fontWeight: FontWeight.normal);
