// customers_list_cubit.dart

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/core/utils/auth.dart';
import 'package:mobizsales/features/customer/data/models/customer_model.dart';
import 'package:mobizsales/features/auth/data/models/user_details_model.dart';
import 'package:mobizsales/features/customer/data/repo/customer_repo.dart';

part 'customers_list_state.dart';

class CustomersListCubit extends Cubit<CustomersListState> {
  CustomersListCubit() : super(const CustomersListState());

  void safeEmit(CustomersListState state) {
    if (!isClosed) emit(state);
  }

  Future<void> initialize() async {
    await getCustomers();
  }

  ///=======================[Get Customers]=======================

  Future<void> getCustomers() async {
    safeEmit(state.copyWith(isLoading: true, error: null));

    try {
      final response = await CustomersRepository.getCustomers(
        routeId: state.userData?.routeId.toString() ?? Auth.routeId,
        storeId: state.userData?.storeId.toString() ?? Auth.storeId,
      );

      if (response != null) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            customers: response.data ?? [],
            isLoaded: true,
          ),
        );
      } else {
        safeEmit(state.copyWith(isLoading: false, error: "No customers found"));
      }
    } catch (e) {
      debugPrint("CUSTOMER ERROR : $e");

      safeEmit(
        state.copyWith(isLoading: false, error: "Failed to load customers"),
      );
    }
  }

  Future<void> refreshCustomers() async {
    await getCustomers();
  }
}
