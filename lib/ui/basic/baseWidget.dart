import 'package:flutter/material.dart';
import 'package:share_your_christmas/ui/basic/mvpView.dart';
import 'package:share_your_christmas/ui/dialog/dialogLoading.dart';
import 'package:share_your_christmas/ui/dialog/menu.dart';
import 'package:share_your_christmas/ui/login/loginScreen.dart';
import 'package:share_your_christmas/ui/register/registerScreen.dart';
import 'package:share_your_christmas/ui/scan/scanScreen.dart';

class BaseWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BaseState();
  }
}

class BaseState<T extends BaseWidget> extends State<T> implements MVPView {
  DialogLoading dialogLoad;

  void openLoginPage(BuildContext context) {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void openRegisterPage(BuildContext context) {
    Navigator.pushNamed(context, RegisterScreen.routeName);
  }

  void openScanPage(BuildContext context) {
    Navigator.pushNamed(context, ScanScreen.routeName);
  }

  // new
  Widget get _loadingView {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

  Widget makeParent(Widget widget) {
    return GestureDetector(
        child: widget,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        });
  }

  @override
  void hideKeyboard() {
    // TODO: implement hideKeyboard
  }

  @override
  void hideLoading() {
    // TODO: implement hideLoading
    if (dialogLoad != null) {
      dialogLoad.onDissmis(context);
    }
  }

  @override
  void onTokenExpired() {
    // TODO: implement onTokenExpired
  }

  @override
  void showLoading() {
    if (dialogLoad == null) {
      dialogLoad = new DialogLoading();
    }
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => dialogLoad);
  }

  void notifyError(String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text(error),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void showMyMenu() {
    showDialog(context: context, builder: (BuildContext context) => Menu());
  }
}
