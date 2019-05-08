import 'package:share_your_christmas/data/redux/commonAction.dart';
import 'package:share_your_christmas/data/redux/login/authReducer.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/config/config.dart';
import 'package:redux/redux.dart';

MyAppState appStateReducer(MyAppState state, action) {
  return state.rebuild((b) => b
    ..isLoading = loadingReducer(state.isLoading, action)
    ..userProfile.replace(appStateLoginReducer(state, action))
    ..config.replace(currentConfig(state.config, action))
  );
}

final loadingReducer = combineReducers<bool>([
  TypedReducer<bool, StartLoading>(_setLoading),
  TypedReducer<bool, StopLoading>(_setLoaded),
]);

bool _setLoading(bool state, action) {
  return true;
}

bool _setLoaded(bool state, action) {
  return false;
}


Reducer<Config> currentConfig = combineReducers([
  TypedReducer<Config, LoadConfigAction>(loadedConfigReducer),
]);


Config loadedConfigReducer(Config config, LoadConfigAction action) {
  return action.config ?? config;
}