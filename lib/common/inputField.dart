import 'package:flutter/material.dart';
import 'package:share_your_christmas/utils/localization.dart' show Localization;
import 'package:share_your_christmas/utils/screenUtil.dart';

class InputField extends StatelessWidget {
  IconData icon;
  String hintText;
  TextInputType textInputType;
  Color textFieldColor, iconColor;
  bool obscureText;
  double bottomMargin;
  TextEditingController controller;
  TextStyle textStyle, hintStyle;
  var validateFunction;
  var onSaved;
  Key key;

  //passing props in the Constructor.
  //Java like style
  InputField(
      {this.key,
      this.hintText,
      this.obscureText,
      this.textInputType,
      this.textFieldColor,
      this.icon,
      this.iconColor,
      this.bottomMargin,
      this.controller,
      this.textStyle,
      this.validateFunction,
      this.onSaved,
      this.hintStyle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var localization = Localization.of(context);
    return (new Container(
        margin: EdgeInsets.only(bottom: bottomMargin),
        height: ScreenUtil.getInstance().getHeightPercent(0.06),
        child: new DecoratedBox(
          decoration: new BoxDecoration(
              borderRadius: new BorderRadius.all(new Radius.circular(
                  ScreenUtil.getInstance().getHeightPercent(0.12))),
              color: textFieldColor),
          child: Container(
            padding: EdgeInsets.only(
                left: ScreenUtil.getInstance().getWidthPercent(0.02),
                right: ScreenUtil.getInstance().getHeightPercent(0.02)),
            alignment: Alignment.center,
            child: new TextFormField(
              style: textStyle,
              key: key,
              obscureText: obscureText,
              keyboardType: textInputType,
              validator: validateFunction,
              controller: controller,
              onSaved: onSaved,
              decoration: new InputDecoration(
                hintText: localization.trans(hintText),
                border: InputBorder.none,
                hintStyle: hintStyle,
                icon: new Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ),
          ),
        )));
  }
}
