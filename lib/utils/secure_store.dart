import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class SecureStore {
  final FlutterSecureStorage storage;
  factory SecureStore()=> SecureStore._();

  SecureStore._(): storage = FlutterSecureStorage();

  void setString(String key, String value ) async =>
      await storage.write(key: key, value: value);

  Future<String> getString(String key) async =>
      await storage.read(key: key);

  Future<void> deleteKey(String key) async =>
      await storage.delete(key: key);
}
