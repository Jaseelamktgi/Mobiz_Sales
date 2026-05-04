import 'package:mobizsales/core/utils/local_storage.dart';

abstract class Auth {
  ///=======================[Get User Data]==================================

  static String get userId => LocalStorage.getData(key: 'user_id') ?? "";

  static String get storeId => LocalStorage.getData(key: 'store_id') ?? "";

  static String get userName => LocalStorage.getData(key: 'user_name') ?? "";

  static String get email => LocalStorage.getData(key: 'email') ?? "";

  static String get roleId => LocalStorage.getData(key: 'role_id') ?? "";

  static String get token => LocalStorage.getData(key: 'token') ?? "";

  static String get routeId => LocalStorage.getData(key: 'route_id') ?? "";

  static String get vanId => LocalStorage.getData(key: 'van_id') ?? "0";

  ///=======================[Save User Data]==================================

  static Future<void> saveUserData({
    required String userId,
    required String storeId,
    required String name,
    required String email,
    required String roleId,
    required String token,
    String routeId = "84",
    String vanId = "0",
  }) async {
    await LocalStorage.setData(key: 'user_id', value: userId);

    await LocalStorage.setData(key: 'store_id', value: storeId);

    await LocalStorage.setData(key: 'user_name', value: name);

    await LocalStorage.setData(key: 'email', value: email);

    await LocalStorage.setData(key: 'role_id', value: roleId);

    await LocalStorage.setData(key: 'token', value: token);

    await LocalStorage.setData(key: 'route_id', value: routeId);

    await LocalStorage.setData(key: 'van_id', value: vanId);
  }

  ///=======================[Clear All Data]==================================

  static Future<void> logout() async {
    await LocalStorage.clearData();
  }
}
