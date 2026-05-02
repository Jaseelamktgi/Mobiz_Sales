import 'package:mobizsales/core/utils/local_storage.dart';

abstract class Auth {
  ///=======================[User Info]==================================

  static String get userId => LocalStorage.getData(key: 'user_id') ?? "";

  static String get storeId => LocalStorage.getData(key: 'store_id') ?? "";

  static String get routeId => LocalStorage.getData(key: 'route_id') ?? "";

  static String get vanId => LocalStorage.getData(key: 'van_id') ?? "0";

  ///=======================[Save Methods]==================================

  static Future<void> saveUserData({
    required String userId,
    String storeId = "112", // default based on API example
    String routeId = "84", // default based on API example
    String vanId = "0",
  }) async {
    await LocalStorage.setData(key: 'user_id', value: userId);
    await LocalStorage.setData(key: 'store_id', value: storeId);
    await LocalStorage.setData(key: 'route_id', value: routeId);
    await LocalStorage.setData(key: 'van_id', value: vanId);
  }

  ///=======================[Clear Data]==================================
}
