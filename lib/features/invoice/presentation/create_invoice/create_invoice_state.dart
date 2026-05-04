// ======================================
// create_invoice_state.dart
// ======================================
part of 'create_invoice_cubit.dart';

class CreateInvoiceState {
  final bool isVat;
  final bool isAmount;
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  final List<InvoiceItem> items; // ✅ STRONG MODEL

  const CreateInvoiceState({
    this.isVat = true,
    this.isAmount = true,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
    this.items = const [], // ✅ default empty
  });

  /// 🔥 TOTAL CALCULATION
  double get total {
    return items.fold(0, (sum, item) => sum + item.amount);
  }

  /// 🔥 TAX
  double get tax => isVat ? total * 0.05 : 0;

  /// 🔥 ROUND OFF
  double get roundOff => 0.00;

  /// 🔥 GRAND TOTAL
  double get grandTotal => total + tax + roundOff;

  /// 🔥 COPY WITH
  CreateInvoiceState copyWith({
    bool? isVat,
    bool? isAmount,
    bool? isLoading,
    bool? isSuccess,
    String? error,
    List<InvoiceItem>? items,
  }) {
    return CreateInvoiceState(
      isVat: isVat ?? this.isVat,
      isAmount: isAmount ?? this.isAmount,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
      items: items ?? this.items,
    );
  }
}
