import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/data/redux/login/actionAuth.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/user/userData.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';
import 'package:share_your_christmas/utils/screenUtil.dart';
import 'package:share_your_christmas/utils/uiUtil.dart';
import 'package:share_your_christmas/utils/fontUtil.dart';

class Menu extends StatelessWidget {
  final double fontSize = 100;

  getLayoutForLogined(constraints, _MenuModel vm) {
    List<Widget> widgets = [
      Text(
        "QUÉT THẺ",
        style: TextStyle(
            fontFamily: UTM_AZUKI_FONT,
            color: Colors.black,
            fontSize: ScreenUtil.getInstance().cvFontSize(fontSize),
            decoration: TextDecoration.none),
      ),
      (makeImageWidget("assets/line.png",
          width: constraints.maxWidth / 1.7, boxFit: BoxFit.contain)),
      Text(
        "THỂ LỆ",
        style: TextStyle(
            fontFamily: UTM_AZUKI_FONT,
            color: Colors.black,
            fontSize: ScreenUtil.getInstance().cvFontSize(fontSize),
            decoration: TextDecoration.none),
      ),
      (makeImageWidget("assets/line.png",
          width: constraints.maxWidth / 1.7, boxFit: BoxFit.contain)),
      Text(
        "TÀI KHOẢN",
        style: TextStyle(
            fontFamily: UTM_AZUKI_FONT,
            color: Colors.black,
            fontSize: ScreenUtil.getInstance().cvFontSize(fontSize),
            decoration: TextDecoration.none),
      ),
      (makeImageWidget("assets/line.png",
          width: constraints.maxWidth / 1.7, boxFit: BoxFit.contain)),
      GestureDetector(
        child: Container(
          child: Text(
            "ĐĂNG XUẤT",
            style: TextStyle(
                fontFamily: UTM_AZUKI_FONT,
                color: Colors.black,
                fontSize: ScreenUtil.getInstance().cvFontSize(fontSize),
                decoration: TextDecoration.none),
          ),
        ),
        onTap: () => vm.onLogout(),
      ),
    ];
    return widgets;
  }

  getLayoutForNonLogin(constraints, _MenuModel vm) {
    List<Widget> widgets = [
      Text(
        "QUÉT THẺ",
        style: TextStyle(
            fontFamily: UTM_AZUKI_FONT,
            color: Colors.black,
            fontSize: ScreenUtil.getInstance().cvFontSize(fontSize),
            decoration: TextDecoration.none),
      ),
      (makeImageWidget("assets/line.png",
          width: constraints.maxWidth / 1.7, boxFit: BoxFit.contain)),
      Text(
        "THỂ LỆ",
        style: TextStyle(
            fontFamily: UTM_AZUKI_FONT,
            color: Colors.black,
            fontSize: ScreenUtil.getInstance().cvFontSize(fontSize),
            decoration: TextDecoration.none),
      ),
      (makeImageWidget("assets/line.png",
          width: constraints.maxWidth / 1.7, boxFit: BoxFit.contain)),
      GestureDetector(
        child: Container(
          child: Text(
            "ĐĂNG NHẬP",
            style: TextStyle(
                fontFamily: UTM_AZUKI_FONT,
                color: Colors.black,
                fontSize: ScreenUtil.getInstance().cvFontSize(fontSize),
                decoration: TextDecoration.none),
          ),
        ),
        onTap: () {
          Navigator.pop(vm.context);
          Navigator.pushNamed(vm.context, "/login");
        },
      ),
      (makeImageWidget("assets/line.png",
          width: constraints.maxWidth / 1.7, boxFit: BoxFit.contain)),
      GestureDetector(
        child: Container(
          child: Text(
            "ĐĂNG KÝ",
            style: TextStyle(
                fontFamily: UTM_AZUKI_FONT,
                color: Colors.black,
                fontSize: ScreenUtil.getInstance().cvFontSize(fontSize),
                decoration: TextDecoration.none),
          ),
        ),
        onTap: () => Navigator.pushNamed(vm.context, "/login"),
      )
    ];
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreConnector<MyAppState, _MenuModel>(
      converter: (Store<MyAppState> store) =>
          _MenuModel.create(store, context),
      builder: (BuildContext context, _MenuModel vm) => Container(
            padding: EdgeInsets.only(
                top: ScreenUtil.getInstance().getTopBarHeight()),
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Positioned(
                          child: makeImageWidget("assets/_bg_menu.png",
                              boxFit: BoxFit.contain),
                          width: constraints.maxWidth,
                        ),
                        Positioned(
                          left: constraints.maxWidth -
                              ScreenUtil.getInstance().cvWidth(200),
                          child: GestureDetector(
                            child: makeImageWidget("assets/ic_close.png",
                                boxFit: BoxFit.contain),
                            onTap: () => Navigator.pop(context),
                          ),
                          width: ScreenUtil.getInstance().cvWidth(150),
                        ),
                        Positioned(
                          top: ScreenUtil.getInstance().cvHeight(20),
                          left: (constraints.maxWidth -
                                  ScreenUtil.getInstance().cvWidth(450)) /
                              2,
                          child: makeImageWidget("assets/logo.png",
                              boxFit: BoxFit.contain),
                          width: ScreenUtil.getInstance().cvWidth(450),
                        ),
                        Positioned(
                          top: ScreenUtil.getInstance().cvHeight(220),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: vm.userProfile.hasData()
                                ? getLayoutForLogined(constraints, vm)
                                : getLayoutForNonLogin(constraints, vm),
                          ),
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.37,
                        ),
                      ]),
            ),
          ),
    );
  }
}

class _MenuModel {
  final UserProfile userProfile;
  final Function() onLogout;
  final BuildContext context;

  _MenuModel({this.userProfile, this.onLogout, this.context});

  factory _MenuModel.create(Store<MyAppState> store, BuildContext context) {
    _onLogout() {
      store.dispatch(Logout(context));
    }

    return _MenuModel(
        userProfile: store.state.userProfile,
        onLogout: _onLogout,
        context: context);
  }
}
