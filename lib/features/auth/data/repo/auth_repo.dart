import 'package:flutter/material.dart';
import 'package:mobizsales/core/utils/api_paths.dart';
import 'package:mobizsales/core/utils/my_dio.dart';
import 'package:mobizsales/features/auth/data/models/login_model.dart';
import 'package:mobizsales/features/auth/data/models/user_details_model.dart';

class AuthRepository {
  static Future<LoginModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: ApiPaths.login,
        body: {"email": email, "password": password},
      );

      if (response != null && response is Map<String, dynamic>) {
        return LoginModel.fromJson(response);
      }

      return null;
    } catch (e) {
      debugPrint("REPO ERROR: $e");
      return null;
    }
  }

  ///=======================[Get User Detail]=======================

  static Future<UserDetailModel?> getUserDetail({
    required String userId,
  }) async {
    try {
      final response = await ApiService.get(
        endpoint: ApiPaths.getUserDetail,
        queryParams: {"user_id": userId},
      );

      if (response != null && response is Map<String, dynamic>) {
        return UserDetailModel.fromJson(response);
      }

      return null;
    } catch (e) {
      debugPrint("USER DETAIL REPO ERROR: $e");
      return null;
    }
  }
}
