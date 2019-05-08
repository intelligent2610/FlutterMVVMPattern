import 'package:share_your_christmas/model/built_vehicle.dart';

class CodeRunner {
  static void runCode() {
    var car = BuiltVehicle((b) => b
      ..type = VehicleType.car
      ..brand = 'Tesla'
      ..price = 10
      ..passengerNames.addAll(['Duy', 'Tran']));

    var copiedCar = car.rebuild((b) => b..brand = "BMW");
    final carJson = car.toJson();
    final carFromJson =
        BuiltVehicle.fromJson(carJson);
  }
}
