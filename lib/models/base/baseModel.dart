import 'dart:convert';

abstract class BaseModel
{
  Map<String, dynamic> toJson();

  String toJsonString() {
    return json.encode(this.toJson());
  }

}