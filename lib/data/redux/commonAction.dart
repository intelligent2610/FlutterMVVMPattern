
import 'package:flutter/widgets.dart';
import 'package:share_your_christmas/model/config/config.dart';

class GetConfigAction {
  final BuildContext context;
  GetConfigAction(this.context);
}
class LoadConfigAction{
  final Config config;

  LoadConfigAction(this.config);
}

class StartLoading {}
class StopLoading {}