
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/ui/basic/baseWidget.dart';
import 'package:share_your_christmas/ui/splash/splashModel.dart';
import 'package:share_your_christmas/utils/screenUtil.dart';
import 'package:share_your_christmas/utils/uiUtil.dart';


class SplashScreen extends BaseWidget {
  static final routeName = "/SplashScreen";

  final void Function(BuildContext context) onInit;

  SplashScreen(Function(BuildContext context) onInit) : onInit = onInit;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends BaseState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    widget.onInit(context);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil()..init(context);

    return StoreConnector<MyAppState, SplashModel>(
      converter: (Store<MyAppState> store) =>
          SplashModel.fromStore(store, context),
      builder: (context, vm) {
        return Container(
          padding:
              EdgeInsets.only(top: ScreenUtil.getInstance().getTopBarHeight()),
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: makeImageDecoration("assets/splash.jpg"),
                fit: BoxFit.cover),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      Container(
                        width: constraints.maxWidth,
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                        margin:
                            EdgeInsets.only(left: 100, right: 100, bottom: 100),
                      )]),
          ),
        );
      },
    );
  }
}
