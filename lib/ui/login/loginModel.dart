import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/data/redux/login/actionAuth.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/completerResult.dart';
import 'package:share_your_christmas/ui/login/loginScreen.dart';
import 'package:share_your_christmas/utils/stringUtil.dart';

class LoginModel {
  final LoginScreenState screenState;
  final BuildContext context;
  final Function(
          String phone, String password, bool isRemember, BuildContext context)
      onLogin;

  LoginModel({this.onLogin, this.context, this.screenState});

  static LoginModel fromStore(Store<MyAppState> store, BuildContext context,
      LoginScreenState screenState) {
    _login(
        String phone, String password, bool isRemember, BuildContext context) {
      Completer<CompleterResult> completer = new Completer<CompleterResult>();
      store.dispatch(
          LoginAction(phone, password, isRemember, completer, context));
      completer.future.then((data) {
        screenState.inValidField(data.messages);
      });
    }

    return LoginModel(
        onLogin: _login, screenState: screenState,
        context: context);
  }

  void doLogin(String email, String password, bool isRemember) {
    String contentInValid;
    contentInValid = validateUserName(email);
    if (contentInValid != null) {
      screenState.inValidField(contentInValid);
      return;
    }
    contentInValid = validatePassword(password);
    if (contentInValid != null) {
      screenState.inValidField(contentInValid);
      return;
    }
    onLogin(email, password, isRemember, context);
  }
}
