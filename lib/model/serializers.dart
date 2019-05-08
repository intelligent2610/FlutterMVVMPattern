library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:share_your_christmas/model/appstate/myAppState.dart';
import 'package:share_your_christmas/model/built_vehicle.dart';
import 'package:share_your_christmas/model/config/config.dart';
import 'package:share_your_christmas/model/user/userData.dart';
import 'package:share_your_christmas/model/user/userProfile.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  BuiltVehicle,
  VehicleType,
  Config,
  MyAppState,
  UserProfile,
  UserData
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
