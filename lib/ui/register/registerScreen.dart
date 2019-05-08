import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/common/inputField.dart';
import 'package:share_your_christmas/common/myTextView.dart';
import 'package:share_your_christmas/common/roundedButton.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/ui/basic/baseWidget.dart';
import 'package:share_your_christmas/ui/login/style.dart';
import 'package:share_your_christmas/ui/register/registerModel.dart';
import 'package:share_your_christmas/utils/fontUtil.dart';
import 'package:share_your_christmas/utils/screenUtil.dart';
import 'package:share_your_christmas/utils/stringUtil.dart';
import 'package:share_your_christmas/utils/uiUtil.dart';

class RegisterScreen extends BaseWidget {
  static final routeName = "/RegisterScreen";

  @override
  State<StatefulWidget> createState() {
    return RegisterScreenState();
  }
}

class RegisterScreenState extends BaseState<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController controllerUserName = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerRePassword = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    controllerUserName.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerRePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return makeParent(StoreConnector<MyAppState, RegisterModel>(
      converter: (Store<MyAppState> store) =>
          RegisterModel.fromStore(store, context, this),
      builder: (context, vm) {
        return Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            width: ScreenUtil.getInstance().getRealWidth(),
            height: ScreenUtil.getInstance().getRealHeight(),
            decoration: new BoxDecoration(
              color: Color(0xffca0000),
            ),
            child: LayoutBuilder(
              builder: (context, constraints) =>
                  Stack(fit: StackFit.loose, children: <Widget>[
                    Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil.getInstance().getTopBarHeight()),
                        width: constraints.maxWidth,
                        alignment: Alignment.topCenter,
                        child: new MyTextView(
                          text: "sign_up",
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(
                              fontFamily: AmaticSC_Bold,
                              color: Colors.white,
                              fontSize:
                                  ScreenUtil.getInstance().cvFontSize(200),
                              decoration: TextDecoration.none),
                        )),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: new Form(
                              autovalidate: false,
                              child: new Column(
                                children: <Widget>[
                                  new InputField(
                                      hintText: "user_name",
                                      obscureText: false,
                                      textInputType: TextInputType.text,
                                      textStyle: textStyle,
                                      textFieldColor: textFieldColor,
                                      controller: controllerUserName,
                                      icon: Icons.mail_outline,
                                      iconColor: Colors.red,
                                      bottomMargin: 5.0,
                                      validateFunction: validateEmail,
                                      onSaved: (String email) {}),
                                  new InputField(
                                      hintText: "email",
                                      obscureText: false,
                                      textInputType: TextInputType.emailAddress,
                                      textStyle: textStyle,
                                      textFieldColor: textFieldColor,
                                      controller: controllerEmail,
                                      icon: Icons.mail_outline,
                                      iconColor: Colors.red,
                                      bottomMargin: 5.0,
                                      validateFunction: validateEmail,
                                      onSaved: (String email) {}),
                                  new InputField(
                                      hintText: "password",
                                      obscureText: true,
                                      textInputType: TextInputType.text,
                                      textStyle: textStyle,
                                      textFieldColor: textFieldColor,
                                      controller: controllerPassword,
                                      icon: Icons.lock_open,
                                      iconColor: Colors.red,
                                      bottomMargin: 5.0,
                                      validateFunction: validatePassword,
                                      onSaved: (String password) {}),
                                  new InputField(
                                      hintText: "re_password",
                                      obscureText: true,
                                      textInputType: TextInputType.text,
                                      textStyle: textStyle,
                                      textFieldColor: textFieldColor,
                                      controller: controllerRePassword,
                                      icon: Icons.lock_open,
                                      iconColor: Colors.red,
                                      bottomMargin: 20.0,
                                      validateFunction: validatePassword,
                                      onSaved: (String password) {}),
                                  new RoundedButton(
                                    buttonName: "SUBMIT",
                                    width: ScreenUtil.getInstance()
                                        .getWidthPercent(60),
                                    height: 50.0,
                                    bottomMargin: 10.0,
                                    borderWidth: 2.0,
                                    onTap: () {
                                      showLoading();
                                      vm.doRegister(
                                          controllerUserName.text,
                                          controllerEmail.text,
                                          controllerPassword.text,
                                          controllerRePassword.text);
                                    },
                                    buttonColor: primaryColor,
                                  )
                                ],
                              ),
                            ),
                            width: constraints.maxWidth,
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  top: ScreenUtil.getInstance().cvHeight(20))),
                        ],
                      ),
                      margin: EdgeInsets.only(
                          top: (ScreenUtil.getInstance().cvHeight(400) +
                              ScreenUtil.getInstance().getTopBarHeight()),
                          left: ScreenUtil.getInstance().getWidthPercent(0.12),
                          right:
                              ScreenUtil.getInstance().getWidthPercent(0.12)),
                    ),
                    Container(
                      child: makeImageWidget("assets/snow_bottom.png",
                          boxFit: BoxFit.contain),
                      width: ScreenUtil.getInstance().getWidthPercent(1),
                      alignment: Alignment.bottomCenter,
                    ),
                    Container(
                      child: Container(
                        child: makeImageWidget("assets/decore_snow_left.png",
                            boxFit: BoxFit.fitHeight,
                            width:
                                ScreenUtil.getInstance().getWidthPercent(0.3)),
                        alignment: Alignment.topLeft,
                      ),
                      width: ScreenUtil.getInstance().getRealWidth(),
                    ),
                    Container(
                      child: Container(
                        child: makeImageWidget("assets/decore_snow_right.png",
                            boxFit: BoxFit.contain,
                            width:
                                ScreenUtil.getInstance().getWidthPercent(0.4)),
                        alignment: Alignment.topRight,
                      ),
                      width: ScreenUtil.getInstance().getRealWidth(),
                    ),
                  ]),
            ),
          ),
        );
      },
    ));
  }

  void inValidField(String contentInValid) {
    hideLoading();
    notifyError(contentInValid);
  }
}
