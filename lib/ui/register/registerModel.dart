import 'dart:async';

import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/data/redux/login/actionAuth.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/completerResult.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';
import 'package:share_your_christmas/ui/register/registerScreen.dart';
import 'package:share_your_christmas/utils/stringUtil.dart';

class RegisterModel {
  final UserProfile userProfile;
  final RegisterScreenState screenState;
  final BuildContext context;
  final Function(
          String username, String email, String password, BuildContext context)
      onRegister;

  RegisterModel(
      {@required this.userProfile,
      this.screenState,
      this.onRegister,
      this.context});

  static RegisterModel fromStore(Store<MyAppState> store, BuildContext context,
      RegisterScreenState screenState) {
    _onRegister(
        String username, String email, String password, BuildContext context) {
      Completer<CompleterResult> completer = new Completer<CompleterResult>();
      store.dispatch(
          RegisterAction(username, email, password, completer, context));
      completer.future.then((data) {
        screenState.inValidField(data.messages);
      });
    }

    return RegisterModel(
        userProfile: store.state.userProfile,
        screenState: screenState,
        context: context,
        onRegister: _onRegister);
  }

  void doRegister(
      String username, String email, String password, String repassword) {
    String contentInValid;
    contentInValid = validateUserName(username);
    if (contentInValid != null) {
      screenState.inValidField(contentInValid);
      return;
    }
    contentInValid = validateEmail(email);
    if (contentInValid != null) {
      screenState.inValidField(contentInValid);
      return;
    }
    contentInValid = validatePassword(password);
    if (contentInValid != null) {
      screenState.inValidField(contentInValid);
      return;
    }
    contentInValid = validateRePassword(password, repassword);
    if (contentInValid != null) {
      screenState.inValidField(contentInValid);
      return;
    }
    onRegister(username, email, password, context);
  }
}
