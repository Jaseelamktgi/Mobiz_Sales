// customers_list_state.dart

part of 'customers_list_cubit.dart';

@immutable
class CustomersListState {
  final bool isLoading;
  final String? error;
  final bool isLoaded;

  final List<CustomerData> customers;
  final UserDetailData? userData;

  const CustomersListState({
    this.isLoading = false,
    this.error,
    this.isLoaded = false,
    this.customers = const [],
    this.userData,
  });

  CustomersListState copyWith({
    bool? isLoading,
    String? error,
    bool? isLoaded,
    List<CustomerData>? customers,
    UserDetailData? userData,
  }) {
    return CustomersListState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      isLoaded: isLoaded ?? this.isLoaded,
      customers: customers ?? this.customers,
      userData: userData ?? this.userData,
    );
  }
}
