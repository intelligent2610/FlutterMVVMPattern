import 'package:share_your_christmas/data/redux/scan/actionScan.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/scan/scanModel.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';
import 'actionAuth.dart';
import 'package:redux/redux.dart';

UserProfile appStateLoginReducer(MyAppState state, action) {
  return userReducer(state.userProfile, action);
}

Reducer<ScanRs> scanReducer = combineReducers<ScanRs>([
  TypedReducer<ScanRs, ResponseScanFromServer>(loadedScanReducer),
]);

ScanRs loadedScanReducer(ScanRs scanRs, ResponseScanFromServer action) {
  return action.scanRs ?? scanRs;
}

Reducer<UserProfile> userReducer = combineReducers<UserProfile>([
  TypedReducer<UserProfile, LoadedUserProfileAction>(loadedReducer),
  TypedReducer<UserProfile, Logout>(logoutReducer),
]);

UserProfile loadedReducer(UserProfile userProfile, LoadedUserProfileAction action) {
  return action.userProfile ?? userProfile;
}

UserProfile logoutReducer(UserProfile userProfile, Logout action) {
  return UserProfile();
}
