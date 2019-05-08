import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/data/dataManager.dart';
import 'package:share_your_christmas/data/redux/commonAction.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/config/config.dart';
import 'package:share_your_christmas/ui/login/loginScreen.dart';

List<Middleware<MyAppState>> appStateCommonMiddleware() {
  MyAppState state = MyAppState();
  final loadConfig = _getConfig(state);

  return [
    TypedMiddleware<MyAppState, GetConfigAction>(loadConfig),
  ];
}

Middleware<MyAppState> _getConfig(MyAppState state) {
  return (Store<MyAppState> store, action, NextDispatcher next) {
    next(action);
    DataManager.getInstance().doConfig().then((response) {
      if (response.isSucceed) {
        MyAppState newState = state.rebuild(
            (b) => b..config.replace(Config.fromJson(response.data)));
        Navigator.of(action.context).pushReplacementNamed(LoginScreen.routeName);
        store.dispatch(LoadConfigAction(newState.config));
      } else {

      }
    });
  };
}
