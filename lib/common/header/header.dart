import 'package:flutter/material.dart';
import 'package:share_your_christmas/utils/uiUtil.dart';
import 'package:share_your_christmas/utils/screenUtil.dart';

class Header extends StatefulWidget {
  final Function onClickMenu;
  final bool isCloseMode;
  Header(this.onClickMenu, [this.isCloseMode = false]);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HeaderState();
  }
}

class _HeaderState extends State<Header> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
              fit: StackFit.loose,
              alignment: Alignment.topCenter,
              children: <Widget>[
                Container(
                  child: makeImageWidget("assets/logo.png",
                      boxFit: BoxFit.contain),
                  width: ScreenUtil.getInstance().cvWidth(450),
                  alignment: Alignment.topRight,
                ),
                Positioned(
                  left: constraints.maxWidth -
                      ScreenUtil.getInstance().cvWidth(200),
                  child: GestureDetector(
                    child: makeImageWidget(
                        widget.isCloseMode
                            ? "assets/ic_close.png"
                            : "assets/ic_menu.png",
                        boxFit: BoxFit.contain),
                    onTap: () => widget.onClickMenu(),
                  ),
                  width: ScreenUtil.getInstance().cvWidth(150),
                )
              ]),
    );
  }
}
