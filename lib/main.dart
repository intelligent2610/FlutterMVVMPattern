import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import 'package:share_your_christmas/data/redux/commonAction.dart';
import 'package:share_your_christmas/data/redux/commonMiddleware.dart';
import 'package:share_your_christmas/data/redux/login/actionAuth.dart';
import 'package:share_your_christmas/data/redux/login/authMiddleware.dart';
import 'package:share_your_christmas/data/redux/reducer.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/ui/home/homeScreen.dart';
import 'package:share_your_christmas/ui/login/loginScreen.dart';
import 'package:share_your_christmas/ui/register/registerScreen.dart';
import 'package:share_your_christmas/ui/scan/scanScreen.dart';
import 'package:share_your_christmas/ui/splash/splashScreen.dart';
import 'package:share_your_christmas/utils/localization.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final DevToolsStore<MyAppState> store = DevToolsStore<MyAppState>(
        appStateReducer,
        initialState: MyAppState(),
        middleware: []
          ..addAll(appStateCommonMiddleware())
          ..addAll(appStateLoginMiddleware()));

    return StoreProvider<MyAppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          HomeScreen.routeName: (context) => HomeScreen(store, () {
                store.dispatch({});
              }),
          SplashScreen.routeName: (context) => SplashScreen((ct) {
                store.dispatch(GetConfigAction(ct));
              }),
          LoginScreen.routeName: (context) => LoginScreen((ct) {
                store.dispatch(LoadUserProfileAction(ct, null));
              }),
          ScanScreen.routeName: (context) => ScanScreen(),
          RegisterScreen.routeName: (context) => RegisterScreen()
        },
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('ko', 'KR'),
        ],
        localizationsDelegates: [
          const LocalizationDelegate(),
        ],
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) {
          if (locale == null) {
            print("*language locale is null!!!");
            return supportedLocales.first;
          }
          for (Locale supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode ||
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        home: StoreBuilder<MyAppState>(
            builder: (BuildContext context, Store<MyAppState> store) =>
                SplashScreen(
                  (ct) {
                    store.dispatch(GetConfigAction(ct));
                  },
                )),
      ),
    );
  }
}

class MyCustomRoute<T> extends MaterialPageRoute<T> {
  MyCustomRoute({WidgetBuilder builder, RouteSettings settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.isInitialRoute) return child;
    // Fades between routes. (If you don't want any animation,
    // just return child.)
    return new FadeTransition(opacity: animation, child: child);
  }
}
