import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/core/utils/auth.dart';
import 'package:mobizsales/features/invoice/data/models/invoice_models.dart';
import 'package:mobizsales/features/invoice/data/repo/invoice_repo.dart';

part 'create_invoice_state.dart';

class CreateInvoiceCubit extends Cubit<CreateInvoiceState> {
  CreateInvoiceCubit() : super(const CreateInvoiceState()); // ✅ FIXED

  final remarksController = TextEditingController();
  final discountController = TextEditingController();

  void safeEmit(CreateInvoiceState newState) {
    if (!isClosed) emit(newState);
  }

  void toggleVat(bool value) {
    safeEmit(state.copyWith(isVat: value));
  }

  void toggleDiscount(bool value) {
    safeEmit(state.copyWith(isAmount: value));
  }

  void addProduct({
    required int id,
    required String code,
    required String name,
    required String type,
    required int productTypeId,
    required String unit,
    required int unitId,
    required int qty,
    required double rate,
  }) {
    final newItem = InvoiceItem(
      id: id,
      code: code,
      name: name,
      type: type,
      productTypeId: productTypeId,
      unit: unit,
      unitId: unitId,
      qty: qty,
      rate: rate,
    );

    final updatedList = List<InvoiceItem>.from(state.items)..add(newItem);

    safeEmit(state.copyWith(items: updatedList));
  }

  void removeProduct(int index) {
    final updated = List<InvoiceItem>.from(state.items);

    if (index >= 0 && index < updated.length) {
      updated.removeAt(index);
      safeEmit(state.copyWith(items: updated));
    }
  }

  void clearProducts() {
    safeEmit(state.copyWith(items: []));
  }

  // ==========================================
  // CREATE SALE API
  // ==========================================

  Future<void> createInvoice({required int customerId}) async {
    safeEmit(state.copyWith(isLoading: true, isSuccess: false, error: null));

    try {
      final body = {
        "customer_id": customerId,
        "store_id": int.parse(Auth.storeId),
        "user_id": int.parse(Auth.userId),
        "van_id": int.parse(Auth.vanId),
        "save_mode": "normal",
        "order_type": 1,
        "discount": double.tryParse(discountController.text.trim()) ?? 0,
        "total": state.total,
        "total_tax": state.tax,
        "grand_total": state.grandTotal,
        "round_off": state.roundOff,
        "if_vat": state.isVat ? 1 : 0,
        "remarks": remarksController.text.trim(),

        "item_id": state.items.map((e) => e.id).toList(),
        "quantity": state.items.map((e) => e.qty).toList(),
        "mrp": state.items.map((e) => e.rate).toList(),
        "product_type": state.items.map((e) => e.productTypeId).toList(),
        "unit": state.items.map((e) => e.unitId).toList(),
      };

      final response = await InvoiceRepository.createInvoice(body: body);

      if (response != null) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            isSuccess: true,
            error: null,
            items: [],
          ),
        );

        remarksController.clear();
        discountController.clear();
      } else {
        safeEmit(
          state.copyWith(
            isLoading: false,
            isSuccess: false,
            error: "Failed to create invoice",
          ),
        );
      }
    } catch (e) {
      safeEmit(
        state.copyWith(isLoading: false, isSuccess: false, error: e.toString()),
      );
    }
  }

  @override
  Future<void> close() {
    remarksController.dispose();
    discountController.dispose();
    return super.close();
  }
}
