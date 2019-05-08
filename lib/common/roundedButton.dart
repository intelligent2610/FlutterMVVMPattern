import 'package:flutter/material.dart';
import 'package:share_your_christmas/utils/localization.dart' show Localization;

class RoundedButton extends StatelessWidget {
  String buttonName;
  final VoidCallback onTap;

  double height;
  double width;
  double bottomMargin;
  double borderWidth;
  Color buttonColor;

  TextStyle textStyle = const TextStyle(
      color: const Color(0XFFFFFFFF),
      fontSize: 16.0,
      fontWeight: FontWeight.bold);

  //passing props in react style
  RoundedButton(
      {this.buttonName,
      this.onTap,
      this.height,
      this.bottomMargin,
      this.borderWidth,
      this.width,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    var localization = Localization.of(context);
    return Container(
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
          color: buttonColor,
          border: new Border.all(
              color: const Color.fromRGBO(221, 221, 221, 1.0),
              width: borderWidth)),
      margin: new EdgeInsets.only(bottom: bottomMargin),
      child: Material(
          color: Colors.transparent,
          child: (new InkWell(
            onTap: onTap,
            borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
            child: new Container(
              width: width,
              height: height,
              alignment: FractionalOffset.center,
              child: new Text(localization.trans(buttonName), style: textStyle),
            ),
          ))),
    );
  }
}
