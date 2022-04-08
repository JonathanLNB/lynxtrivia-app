import 'package:get/get.dart';
import 'package:preguntados/src/data/providers/LocalSession.dart';

class SessionManager {
  final LocalSession _provider = Get.find<LocalSession>();

  //Getters
  Future<String> getAccessToken() => _provider.getAccessToken();
  Future<String> getUser() => _provider.getUser();

  //Setters
  setAccessToken(String accessToken) => _provider.setAccessToken(accessToken);
  setUser(String user) => _provider.setUser(user);
}