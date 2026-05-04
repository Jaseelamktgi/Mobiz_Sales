import 'package:flutter/material.dart';
import 'package:mobizsales/core/utils/api_paths.dart';
import 'package:mobizsales/core/utils/my_dio.dart';
import 'package:mobizsales/features/customer/data/models/customer_model.dart';

class CustomersRepository {
  ///=======================[Get Customers]=======================

  static Future<CustomerModel?> getCustomers({
    required String routeId,
    required String storeId,
  }) async {
    try {
      final response = await ApiService.get(
        endpoint: ApiPaths.getCustomer,
        queryParams: {"route_id": routeId, "store_id": storeId},
      );

      if (response != null && response is Map<String, dynamic>) {
        return CustomerModel.fromJson(response);
      }

      return null;
    } catch (e) {
      debugPrint("CUSTOMER REPO ERROR: $e");
      return null;
    }
  }
}
