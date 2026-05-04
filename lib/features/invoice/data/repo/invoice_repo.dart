import 'package:mobizsales/core/utils/api_paths.dart';
import 'package:mobizsales/core/utils/auth.dart';
import 'package:mobizsales/core/utils/my_dio.dart';

import '../models/invoice_models.dart';

class InvoiceRepository {
  static Future<InvoiceModel?> getInvoices() async {
    try {
      final response = await ApiService.get(
        endpoint: ApiPaths.getVanSaleList,
        queryParams: {
          "user_id": Auth.userId,
          "store_id": Auth.storeId,
          "van_id": Auth.vanId,
        },
      );

      if (response != null && response is Map<String, dynamic>) {
        return InvoiceModel.fromJson(response);
      }

      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<Map<String, dynamic>?> createInvoice({
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await ApiService.post(
        endpoint: ApiPaths.createVanSale,
        body: body,
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
