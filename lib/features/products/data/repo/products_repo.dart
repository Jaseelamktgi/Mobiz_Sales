// product_repo.dart

import 'package:mobizsales/core/utils/api_paths.dart';
import 'package:mobizsales/core/utils/auth.dart';
import 'package:mobizsales/core/utils/my_dio.dart';
import 'package:mobizsales/features/products/data/models/product_model.dart';

class ProductsRepository {
  static Future<ProductModel?> getProducts() async {
    try {
      final response = await ApiService.get(
        endpoint: ApiPaths.getProduct,
        queryParams: {"store_id": Auth.storeId},
      );

      if (response != null && response is Map<String, dynamic>) {
        return ProductModel.fromJson(response);
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<List<dynamic>> getProductTypes() async {
    try {
      final response = await ApiService.get(endpoint: ApiPaths.getProductType);

      if (response != null && response is Map<String, dynamic>) {
        return response['data'] ?? [];
      }

      return [];
    } catch (e) {
      return [];
    }
  }

  static Future<Map<String, dynamic>?> getProductDetail({
    required String productId,
  }) async {
    try {
      final response = await ApiService.get(
        endpoint: ApiPaths.getProductDetail,
        queryParams: {"product_id": productId},
      );

      if (response != null && response is Map<String, dynamic>) {
        return response;
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
