import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/common/header/header.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/ui/basic/baseWidget.dart';
import 'package:share_your_christmas/ui/login/loginModel.dart';
import 'package:share_your_christmas/utils/fontUtil.dart';
import 'package:share_your_christmas/utils/screenUtil.dart';
import 'package:share_your_christmas/utils/uiUtil.dart';

class LoginScreen extends BaseWidget {
  static final routeName = "/LoginScreen";

  LoginScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginScreenState();
  }
}

class _LoginScreenState extends BaseState<LoginScreen> {
  bool _isRemember = true;

  @override
  void initState() {
    super.initState();
  }

  void _toggleRemember() {
    setState(() {
      _isRemember = !_isRemember;
    });
  }

  final TextStyle _textStyleHintEditText = TextStyle(
    fontFamily: SEGOEPR_FONT,
    color: Color(0x90ff0000),
    fontSize: ScreenUtil.getInstance().cvFontSize(35),
    decoration: TextDecoration.none,
  );

  final TextStyle _textStyleEditText = TextStyle(
    fontFamily: SEGOEPR_FONT,
    color: Colors.red,
    fontSize: ScreenUtil.getInstance().cvFontSize(35),
    decoration: TextDecoration.none,
  );

  final TextStyle _textStyleLabel = TextStyle(
    fontFamily: SEGOEPR_FONT,
    color: Colors.white,
    fontSize: ScreenUtil.getInstance().cvFontSize(35),
    decoration: TextDecoration.none,
  );

  final TextStyle _textStyleLabelUnderline = TextStyle(
    fontFamily: SEGOEPR_FONT,
    color: Colors.white,
    fontSize: ScreenUtil.getInstance().cvFontSize(35),
    decoration: TextDecoration.underline,
    decorationColor: Colors.red,
  );

  final TextStyle _textStyleLabelRedUnderline = TextStyle(
    fontFamily: SEGOEPR_FONT,
    color: Colors.red,
    fontSize: ScreenUtil.getInstance().cvFontSize(35),
    decoration: TextDecoration.underline,
    decorationColor: Colors.red,
  );

  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    controllerPhone.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build'
    return StoreConnector<MyAppState, LoginModel>(
      converter: (Store<MyAppState> store) =>
          LoginModel.fromStore(store, context, null),
      builder: (context, vm) {
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            padding: EdgeInsets.only(
                top: ScreenUtil.getInstance().getTopBarHeight()),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: makeImageDecoration("assets/bg_home.jpg"),
                  fit: BoxFit.cover),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                            width: constraints.maxWidth,
                            child: Header(() => Navigator.pop(context), true)),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Container(
                                  child: makeImageWidget(
                                      "assets/title_login.png",
                                      boxFit: BoxFit.contain),
                                  width:
                                      ScreenUtil.getInstance().getRealWidth(),
                                  margin: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil.getInstance()
                                          .cvWidth(90))),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: ScreenUtil.getInstance()
                                          .cvHeight(50))),
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: makeImageWidget(
                                        "assets/arrow_left.png",
                                        boxFit: BoxFit.contain),
                                    height:
                                        ScreenUtil.getInstance().cvHeight(90),
                                  ),
                                  Flexible(
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                            image: makeImageDecoration(
                                                "assets/bt_button.png"),
                                            fit: BoxFit.fill),
                                      ),
                                      child: TextField(
                                        controller: controllerPhone,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: _textStyleEditText,
                                        keyboardType:
                                            TextInputType.numberWithOptions(),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: _textStyleHintEditText,
                                            hintText:
                                                'Vui lòng nhập số điện thoại'),
                                      ),
                                      width:
                                          ScreenUtil.getInstance().cvWidth(720),
                                      height: ScreenUtil.getInstance()
                                          .cvHeight(100),
                                    ),
                                  ),
                                  Container(
                                    child: makeImageWidget(
                                        "assets/arrow_right.png",
                                        boxFit: BoxFit.contain),
                                    height:
                                        ScreenUtil.getInstance().cvHeight(90),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: ScreenUtil.getInstance()
                                          .cvHeight(50))),
                              Row(
                                children: <Widget>[
                                  Container(
                                    child: makeImageWidget(
                                        "assets/arrow_left.png",
                                        boxFit: BoxFit.contain),
                                    height:
                                        ScreenUtil.getInstance().cvHeight(90),
                                  ),
                                  Flexible(
                                    child: Container(
                                      decoration: new BoxDecoration(
                                        image: new DecorationImage(
                                            image: makeImageDecoration(
                                                "assets/bt_button.png"),
                                            fit: BoxFit.fill),
                                      ),
                                      child: TextField(
                                        controller: controllerPassword,
                                        obscureText: true,
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style: _textStyleEditText,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintStyle: _textStyleHintEditText,
                                            hintText: 'Vui lòng nhập mật khẩu'),
                                      ),
                                      width:
                                          ScreenUtil.getInstance().cvWidth(720),
                                      height: ScreenUtil.getInstance()
                                          .cvHeight(100),
                                    ),
                                  ),
                                  Container(
                                    child: makeImageWidget(
                                        "assets/arrow_right.png",
                                        boxFit: BoxFit.contain),
                                    height:
                                        ScreenUtil.getInstance().cvHeight(90),
                                  )
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: ScreenUtil.getInstance()
                                          .cvHeight(50))),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        ScreenUtil.getInstance().cvWidth(100)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        IconButton(
                                          icon: (_isRemember
                                              ? makeImageWidget(
                                                  "assets/ic_checked.png",
                                                  boxFit: BoxFit.contain,
                                                  width:
                                                      ScreenUtil.getInstance()
                                                          .cvWidth(100))
                                              : makeImageWidget(
                                                  "assets/ic_uncheck.png",
                                                  boxFit: BoxFit.contain,
                                                  width:
                                                      ScreenUtil.getInstance()
                                                          .cvWidth(100))),
                                          color: Colors.red[500],
                                          onPressed: _toggleRemember,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: ScreenUtil.getInstance()
                                                    .cvWidth(20))),
                                        Text("Ghi Nhớ",
                                            style: _textStyleLabel,
                                            textAlign: TextAlign.center)
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Quên Mật Khẩu",
                                            style: _textStyleLabelUnderline,
                                            textAlign: TextAlign.center)
                                      ],
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: ScreenUtil.getInstance()
                                          .cvHeight(50))),
                              Text(
                                "Nếu chưa có tài khoản",
                                style: _textStyleLabel,
                              ),
                              GestureDetector(
                                child: Text("Đăng Kí Tại Đây",
                                    style: _textStyleLabelRedUnderline,
                                    textAlign: TextAlign.center),
                                onTap: () => {},
                              ),
                              Padding(
                                  padding: EdgeInsets.only(
                                      top: ScreenUtil.getInstance()
                                          .cvHeight(50))),
                              GestureDetector(
                                child: Container(
                                  child: makeImageWidget("assets/bt_login.png",
                                      boxFit: BoxFit.contain),
                                  width: ScreenUtil.getInstance().cvWidth(650),
                                  margin: EdgeInsets.only(
                                      top: ScreenUtil.getInstance()
                                          .cvHeight(30)),
                                ),
                                onTap: () {
                                  showLoading();
//                                  vm.onLogin(controllerPhone.text,
//                                      controllerPassword.text, _isRemember);
                                },
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(
                              top: ScreenUtil.getInstance().cvHeight(250)),
                        ),
                        Container(
                          child: makeImageWidget("assets/copy_home.png",
                              boxFit: BoxFit.contain),
                          width: ScreenUtil.getInstance().cvWidth(600),
                          margin: EdgeInsets.only(
                              top: ScreenUtil.getInstance().cvHeight(280),
                              bottom:
                                  ScreenUtil.getInstance().getBottomHeight()),
                          alignment: Alignment.bottomCenter,
                        )
                      ]),
            ),
          ),
        );
      },
    );
  }

  @override
  void loginSuccess() {
    // TODO: implement loginSuccess
  }
}
