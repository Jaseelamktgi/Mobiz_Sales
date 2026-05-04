import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selected_customer_state.dart';

class SelectedCustomerCubit extends Cubit<SelectedCustomerState> {
  SelectedCustomerCubit() : super(SelectedCustomerInitial());
}
