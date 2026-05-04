// invoice_list_state.dart

part of 'invoice_list_cubit.dart';

@immutable
class InvoiceListState {
  final bool isLoading;
  final bool isLoaded;
  final String? error;
  final List<InvoiceData> invoices;

  const InvoiceListState({
    this.isLoading = false,
    this.isLoaded = false,
    this.error,
    this.invoices = const [],
  });

  InvoiceListState copyWith({
    bool? isLoading,
    bool? isLoaded,
    String? error,
    List<InvoiceData>? invoices,
  }) {
    return InvoiceListState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      error: error,
      invoices: invoices ?? this.invoices,
    );
  }
}
