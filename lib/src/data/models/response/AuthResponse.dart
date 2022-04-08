import 'dart:convert';

import '../Usuario.dart';

class AuthResponse {
  AuthResponse({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(jsonDecode(str));

  String toJson() => jsonEncode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        success: json["success"] ?? null,
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "success": success ?? null,
        "data": data == null ? null : data.toMap(),
      };
}

class Data {
  Data({
    this.user,
    this.token,
  });

  Usuario user;
  String token;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : Usuario.fromMap(json["user"]),
        token: json["token"] ?? null,
      );

  Map<String, dynamic> toMap() => {
        "user": user == null ? null : user.toMap(),
        "token": token ?? null,
      };
}
