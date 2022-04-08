import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class LocalSession {
  final FlutterSecureStorage _storage = Get.find<FlutterSecureStorage>();

  static const String USER = "USER";
  static const String TOKEN = "SESSION_TOKEN";

  setAccessToken(String accessToken) async {
    await _storage.write(key: TOKEN, value: accessToken);
  }

  Future<String> getAccessToken() async {
    return _storage.read(key: TOKEN) ?? "";
  }

  setUser(String user) async {
    await _storage.write(key: USER, value: user);
  }

  Future<String> getUser() async {
    return _storage.read(key: USER) ?? "";
  }
}
