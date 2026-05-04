class LoginModel {
  String? status;
  String? message;
  User? user;
  Settings? settings;

  LoginModel({this.status, this.message, this.user, this.settings});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'],
      message: json['message'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      settings: json['settings'] != null
          ? Settings.fromJson(json['settings'])
          : null,
    );
  }
}

class User {
  int? id;
  String? name;
  String? email;
  dynamic emailVerifiedAt;
  dynamic isSuperAdmin;
  dynamic isShopAdmin;
  String? isStaff;
  int? departmentId;
  int? designationId;
  int? storeId;
  int? rolId;
  dynamic productionStore;
  int? glId;
  dynamic commissionType;
  dynamic token;
  String? createdAt;
  String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.isSuperAdmin,
    this.isShopAdmin,
    this.isStaff,
    this.departmentId,
    this.designationId,
    this.storeId,
    this.rolId,
    this.productionStore,
    this.glId,
    this.commissionType,
    this.token,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      isSuperAdmin: json['is_super_admin'],
      isShopAdmin: json['is_shop_admin'],
      isStaff: json['is_staff'],
      departmentId: json['department_id'],
      designationId: json['designation_id'],
      storeId: json['store_id'],
      rolId: json['rol_id'],
      productionStore: json['production_store'],
      glId: json['gl_id'],
      commissionType: json['commission_type'],
      token: json['token'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Settings {
  int? id;
  int? storeId;
  String? vatNoVat;
  String? soRate;
  String? salesRate;
  String? attendance;
  String? discount;
  String? validateQtyInSo;
  String? validateQtyInSales;
  String? integrationType;
  String? printer;
  String? barcodeInInvoice;

  Settings({
    this.id,
    this.storeId,
    this.vatNoVat,
    this.soRate,
    this.salesRate,
    this.attendance,
    this.discount,
    this.validateQtyInSo,
    this.validateQtyInSales,
    this.integrationType,
    this.printer,
    this.barcodeInInvoice,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      id: json['id'],
      storeId: json['store_id'],
      vatNoVat: json['vat_no_vat'],
      soRate: json['so_rate'],
      salesRate: json['sales_rate'],
      attendance: json['attendance'],
      discount: json['discount'],
      validateQtyInSo: json['validate_qty_in_so'],
      validateQtyInSales: json['validate_qty_in_sales'],
      integrationType: json['integration_type'],
      printer: json['printer'],
      barcodeInInvoice: json['barcode_in_invoice'],
    );
  }
}
