import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ScanRs {
  final String image;
  final String message;
  final int is_new;

  ScanRs(this.image, this.message, this.is_new);

  ScanRs.fromJson(Map json)
      : image = json["image"],
        message = json["message"],
        is_new = json["is_new"];

  Map toJson() => {'image': image, 'message': message, 'is_new': is_new};
}
