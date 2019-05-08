import 'package:flutter/widgets.dart';
import 'package:share_your_christmas/utils/localization.dart' show Localization;

class MyTextView extends StatelessWidget {
  Key key;
  String text;
  TextStyle textStyle;
  TextAlign textAlign;
  var onTap;

  MyTextView({this.key, this.text, this.textStyle, this.textAlign, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var localization = Localization.of(context);
    if (onTap != null) {
      return GestureDetector(
        child: Text(
          localization.trans(text),
          key: key,
          textAlign: textAlign,
          style: textStyle,
        ),
        onTap: onTap,
      );
    } else {
      return Text(
        localization.trans(text),
        key: key,
        textAlign: textAlign,
        style: textStyle,
      );
    }
  }
}
