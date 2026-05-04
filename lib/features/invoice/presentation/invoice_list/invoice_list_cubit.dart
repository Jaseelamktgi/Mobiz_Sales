// invoice_list_cubit.dart

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/features/invoice/data/repo/invoice_repo.dart';

import '../../data/models/invoice_models.dart';

part 'invoice_list_state.dart';

class InvoiceListCubit extends Cubit<InvoiceListState> {
  InvoiceListCubit() : super(const InvoiceListState()) {
    getInvoices();
  }

  void safeEmit(InvoiceListState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getInvoices() async {
    safeEmit(state.copyWith(isLoading: true, error: null));

    try {
      final response = await InvoiceRepository.getInvoices();

      if (response != null) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            isLoaded: true,
            invoices: response.data?.data ?? [],
          ),
        );
      } else {
        safeEmit(state.copyWith(isLoading: false, error: "No invoices found"));
      }
    } catch (e) {
      debugPrint("INVOICE CUBIT ERROR : $e");

      safeEmit(
        state.copyWith(isLoading: false, error: "Failed to load invoices"),
      );
    }
  }

  Future<void> refreshInvoices() async {
    await getInvoices();
  }
}
