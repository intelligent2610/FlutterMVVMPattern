library config;

import 'dart:convert';

import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:share_your_christmas/model/serializers.dart';

part 'config.g.dart';

abstract class Config implements Built<Config, ConfigBuilder> {
  String get lang;
  String get langIcon;
  String get domain;
  Config._();

  bool hasData(){
    return lang != null && lang.trim().length>0;
  }

  factory Config() {
    return _$Config._(lang: "", langIcon: "", domain: "");
  }

  String toJson() {
    return json.encode(serializers.serializeWith(Config.serializer, this));
  }

  static Config fromJson(String jsonString) {
    return serializers.deserializeWith(
        Config.serializer, json.decode(jsonString));
  }

  static Serializer<Config> get serializer => _$configSerializer;
}
