library userProfile;

import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:share_your_christmas/model/serializers.dart';
import 'package:share_your_christmas/model/user/userData.dart';

part 'userProfile.g.dart';

abstract class UserProfile implements Built<UserProfile, UserProfileBuilder> {
  String get access_token;

  String get token_type;

  String get refresh_token;

  UserData get userData;

  UserProfile._();

  factory UserProfile() {
    return _$UserProfile._(
        access_token: "",
        token_type: "",
        refresh_token: "",
        userData: UserData());
  }

  bool hasData() {
    return access_token != null && access_token.trim().length > 0;
  }

  String toJson() {
    return json.encode(serializers.serializeWith(UserProfile.serializer, this));
  }

  static UserProfile fromJson(String jsonString) {
    return serializers.deserializeWith(
        UserProfile.serializer, json.decode(jsonString));
  }

  static Serializer<UserProfile> get serializer => _$userProfileSerializer;
}
