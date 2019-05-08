import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:share_your_christmas/model/completerResult.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';

class LoginAction {
  final String username;
  final String password;
  final bool isRemember;
  final BuildContext context;
  final Completer<CompleterResult> completer;

  LoginAction(this.username, this.password, this.isRemember, this.completer,
      this.context);
}

class LoadUserProfileAction {
  final Completer<CompleterResult> completer;
  final BuildContext context;

  LoadUserProfileAction(this.context, this.completer);
}

class Logout {
  final BuildContext context;

  Logout(this.context);
}

class LoadedUserProfileAction {
  final UserProfile userProfile;

  LoadedUserProfileAction(this.userProfile);
}

class RegisterAction {
  final String username;
  final String email;
  final String password;
  final BuildContext context;
  final Completer<CompleterResult> completer;

  RegisterAction(
      this.username, this.email, this.password, this.completer, this.context);
}
