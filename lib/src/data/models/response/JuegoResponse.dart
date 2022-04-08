import 'dart:convert';

import '../Juego.dart';

class JuegoResponse {
  JuegoResponse({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  Juego data;

  factory JuegoResponse.fromJson(String str) =>
      JuegoResponse.fromMap(jsonDecode(str));

  String toJson() => jsonEncode(toMap());

  factory JuegoResponse.fromMap(Map<String, dynamic> json) => JuegoResponse(
        success: json["success"] ?? null,
        message: json["message"] ?? null,
        data: json["data"] == null ? null : Juego.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success ?? null,
        "message": message ?? null,
        "data": data == null ? null : data.toMap(),
      };
}
