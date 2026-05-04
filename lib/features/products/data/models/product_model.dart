// product_model.dart

class ProductModel {
  ProductPagination? data;
  bool? success;
  List<String>? messages;

  ProductModel({this.data, this.success, this.messages});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      data: json['data'] != null
          ? ProductPagination.fromJson(json['data'])
          : null,
      success: json['success'],
      messages: json['messages'] != null
          ? List<String>.from(json['messages'])
          : [],
    );
  }
}

class ProductPagination {
  int? currentPage;
  List<ProductData>? data;
  int? lastPage;

  ProductPagination({this.currentPage, this.data, this.lastPage});

  factory ProductPagination.fromJson(Map<String, dynamic> json) {
    return ProductPagination(
      currentPage: json['current_page'],
      data: json['data'] != null
          ? (json['data'] as List).map((e) => ProductData.fromJson(e)).toList()
          : [],
      lastPage: json['last_page'],
    );
  }
}

class ProductData {
  int? id;
  String? code;
  String? name;
  String? proImage;
  int? taxPercentage;
  dynamic price;
  int? storeId;
  int? status;
  List<ProductUnit>? units;

  ProductData({
    this.id,
    this.code,
    this.name,
    this.proImage,
    this.taxPercentage,
    this.price,
    this.storeId,
    this.status,
    this.units,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      proImage: json['pro_image'],
      taxPercentage: json['tax_percentage'],
      price: json['price'],
      storeId: json['store_id'],
      status: json['status'],
      units: json['units'] != null
          ? (json['units'] as List).map((e) => ProductUnit.fromJson(e)).toList()
          : [],
    );
  }
}

class ProductUnit {
  int? unit;
  int? id;
  String? name;
  String? price;
  dynamic minPrice;
  dynamic stock;

  ProductUnit({
    this.unit,
    this.id,
    this.name,
    this.price,
    this.minPrice,
    this.stock,
  });

  factory ProductUnit.fromJson(Map<String, dynamic> json) {
    return ProductUnit(
      unit: json['unit'],
      id: json['id'],
      name: json['name'],
      price: json['price'],
      minPrice: json['min_price'],
      stock: json['stock'],
    );
  }
}
