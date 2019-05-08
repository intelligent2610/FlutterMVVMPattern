import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/config/config.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';

class SplashModel {
  final UserProfile userData;
  final Config config;

  SplashModel({@required this.userData, this.config});

  static SplashModel fromStore(Store<MyAppState> store, BuildContext context) {

    return SplashModel(userData: store.state.userProfile,config: store.state.config);
  }
}
