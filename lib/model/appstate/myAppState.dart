library myAppState;

import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:share_your_christmas/model/config/config.dart';
import 'package:share_your_christmas/model/serializers.dart';
import 'package:share_your_christmas/model/user/userData.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';

part 'myAppState.g.dart';

abstract class MyAppState implements Built<MyAppState, MyAppStateBuilder> {
  bool get isLoading;

  UserProfile get userProfile;

  Config get config;

  MyAppState._();

  factory MyAppState() {
    return _$MyAppState._(
        isLoading: false, userProfile: UserProfile(), config: Config());
  }

  String toJson() {
    return json.encode(serializers.serializeWith(MyAppState.serializer, this));
  }

  static MyAppState fromJson(String jsonString) {
    return serializers.deserializeWith(
        MyAppState.serializer, json.decode(jsonString));
  }

  static Serializer<MyAppState> get serializer => _$myAppStateSerializer;
}
