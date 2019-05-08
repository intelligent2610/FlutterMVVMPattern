library userData;

import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:share_your_christmas/model/serializers.dart';

part 'userData.g.dart';

abstract class UserData implements Built<UserData, UserDataBuilder> {
  String get id;

  @nullable
  String get username => username ?? "";

  @nullable
  String get email => email ?? "";

  @nullable
  String get phoneNumber;

  @nullable
  String get address;

  UserData._();

  bool hasData() {
    return false;
  }

  factory UserData() {
    return _$UserData._(
        id: "", username: "", email: "", phoneNumber: "", address: "");
  }

  String toJson() {
    return json.encode(serializers.serializeWith(UserData.serializer, this));
  }

  static UserData fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserData.serializer, json.decode(jsonString));
  }

  static Serializer<UserData> get serializer => _$userDataSerializer;
}
