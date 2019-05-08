import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/data/redux/login/actionAuth.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';

class HomeModel {
  final UserProfile userProfile;
  final Function(BuildContext context) onLogout;

  HomeModel({@required this.userProfile, this.onLogout});

  static HomeModel fromStore(Store<MyAppState> store, BuildContext context) {
    _onLogout(BuildContext context) {
      store.dispatch(Logout(context));
    }

    return HomeModel(userProfile: store.state.userProfile, onLogout: _onLogout);
  }
}
