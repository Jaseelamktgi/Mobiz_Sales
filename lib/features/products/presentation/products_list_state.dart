part of 'products_list_cubit.dart';

@immutable
class ProductsListState {
  final bool isLoading;
  final bool isLoaded;
  final String? error;
  final List<ProductData> products;

  const ProductsListState({
    this.isLoading = false,
    this.isLoaded = false,
    this.error,
    this.products = const [],
  });

  ProductsListState copyWith({
    bool? isLoading,
    bool? isLoaded,
    String? error,
    List<ProductData>? products,
  }) {
    return ProductsListState(
      isLoading: isLoading ?? this.isLoading,
      isLoaded: isLoaded ?? this.isLoaded,
      error: error,
      products: products ?? this.products,
    );
  }
}
