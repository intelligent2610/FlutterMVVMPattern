import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/data/redux/scan/actionScan.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';

class ScanModel {
  final UserProfile userProfile;
  final Function(String scanResult) onScan;

  ScanModel({@required this.userProfile, this.onScan});

  static ScanModel fromStore(Store<MyAppState> store, BuildContext context) {
    _scan(String scanResult) {
      store.dispatch(ScanAction(scanResult));
    }

    return ScanModel(userProfile: store.state.userProfile, onScan: _scan);
  }
}
