import 'dart:convert';

import '../Pregunta.dart';

class PreguntaResponse {
  PreguntaResponse({
    this.success,
    this.message,
    this.data,
  });

  bool success;
  String message;
  Pregunta data;

  factory PreguntaResponse.fromJson(String str) => PreguntaResponse.fromMap(jsonDecode(str));

  String toJson() => jsonEncode(toMap());

  factory PreguntaResponse.fromMap(Map<String, dynamic> json) => PreguntaResponse(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : Pregunta.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "data": data == null ? null : data.toMap(),
  };
}