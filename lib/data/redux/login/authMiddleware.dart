import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/model/apiResponse.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/completerResult.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';
import 'package:share_your_christmas/ui/home/homeScreen.dart';
import 'package:share_your_christmas/ui/login/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'actionAuth.dart';
import 'package:share_your_christmas/data/dataManager.dart';

List<Middleware<MyAppState>> appStateLoginMiddleware() {
  MyAppState state = MyAppState();
  final loadItems = _loadFromPrefs(state);
  final logout = _logoutPrefs();
  final doLogin = _doLogin(state);
  final doRegister = _doRegister(state);

  return [
    TypedMiddleware<MyAppState, LoginAction>(doLogin),
    TypedMiddleware<MyAppState, RegisterAction>(doRegister),
    TypedMiddleware<MyAppState, Logout>(logout),
    TypedMiddleware<MyAppState, LoadUserProfileAction>(loadItems)
  ];
}

Middleware<MyAppState> _doRegister(MyAppState state) {
  return (Store<MyAppState> store, action, NextDispatcher next) {
    next(action);
    DataManager.getInstance()
        .doRegister(action.username, action.email, action.password)
        .then((response) {
      if (response.isSucceed) {
        Navigator.of(action.context)
            .pushReplacementNamed(LoginScreen.routeName);
      } else {
        makeFailResponseCompleter(response, action);
      }
    });
  };
}

Middleware<MyAppState> _doLogin(MyAppState state) {
  return (Store<MyAppState> store, action, NextDispatcher next) {
    next(action);
    DataManager.getInstance()
        .doLogin(action.username, action.password, action.isRemember)
        .then((response) {
      if (response.isSucceed) {
        MyAppState newState = state.rebuild(
            (b) => b..userProfile.replace(UserProfile.fromJson(response.data)));
        if (action.isRemember) saveToPrefs(newState);
        store.dispatch(LoadedUserProfileAction(newState.userProfile));
        Navigator.of(action.context).pushReplacementNamed(HomeScreen.routeName);
      } else {
        makeFailResponseCompleter(response, action);
      }
    });
  };
}

void makeFailResponseCompleter(APIResponse response, action) {
  List<dynamic> errors = response.errors;
  String message = "";
  if (errors != null && errors.length > 0) {
    for (String er in errors) {
      message += er + "\n";
    }
  }
  action.completer
      .complete(CompleterResult(response.data, response.isSucceed, message));
}

Middleware<MyAppState> _loadFromPrefs(MyAppState state) {
  return (Store<MyAppState> store, action, NextDispatcher next) {
    next(action);
    loadFromPrefs().then((newState) {
      store.dispatch(LoadedUserProfileAction(newState.userProfile));
      if (newState.userProfile != null && newState.userProfile.hasData()) {
        Navigator.of(action.context).pushReplacementNamed(HomeScreen.routeName);
      }
    });
  };
}

Middleware<MyAppState> _logoutPrefs() {
  return (Store<MyAppState> store, action, NextDispatcher next) {
    next(action);
    logoutPrefs();
    Navigator.of(action.context).pushReplacementNamed(LoginScreen.routeName);
  };
}

void logoutPrefs() async {
  SharedPreferences share = await SharedPreferences.getInstance();
  await share.remove("UserProfile");
}

void saveToPrefs(MyAppState state) async {
  SharedPreferences share = await SharedPreferences.getInstance();
  var str = state.userProfile.toJson();
  await share.setString("UserProfile", str);
}

Future<MyAppState> loadFromPrefs() async {
  SharedPreferences share = await SharedPreferences.getInstance();
  var str = share.getString("UserProfile");
  if (str != null) {
    return MyAppState()
        .rebuild((b) => b..userProfile.replace(UserProfile.fromJson(str)));
  }
  return MyAppState();
}
