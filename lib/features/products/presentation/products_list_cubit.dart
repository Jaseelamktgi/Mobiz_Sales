import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/features/products/data/models/product_model.dart';
import 'package:mobizsales/features/products/data/repo/products_repo.dart';

part 'products_list_state.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  ProductsListCubit() : super(const ProductsListState()) {
    getProducts();
  }

  void safeEmit(ProductsListState state) {
    if (!isClosed) emit(state);
  }

  Future<void> getProducts() async {
    safeEmit(state.copyWith(isLoading: true, error: null));

    try {
      final response = await ProductsRepository.getProducts();

      if (response != null) {
        safeEmit(
          state.copyWith(
            isLoading: false,
            isLoaded: true,
            products: response.data?.data ?? [],
          ),
        );
      } else {
        safeEmit(state.copyWith(isLoading: false, error: "No products found"));
      }
    } catch (e) {
      safeEmit(
        state.copyWith(isLoading: false, error: "Failed to load products"),
      );
    }
  }

  Future<void> refreshProducts() async {
    await getProducts();
  }
}
