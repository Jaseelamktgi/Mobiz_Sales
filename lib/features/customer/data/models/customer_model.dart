class CustomerModel {
  List<CustomerData>? data;
  bool? success;
  List<String>? messages;

  CustomerModel({this.data, this.success, this.messages});

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      data: json['data'] != null
          ? (json['data'] as List).map((e) => CustomerData.fromJson(e)).toList()
          : [],
      success: json['success'],
      messages: json['messages'] != null
          ? List<String>.from(json['messages'])
          : [],
    );
  }
}

class CustomerData {
  int? id;
  String? name;
  String? code;
  String? address;
  String? building;
  String? flatNo;
  String? contactNumber;
  String? whatsappNumber;
  String? email;
  String? trn;
  String? custImage;
  String? paymentTerms;

  int? creditLimit;
  int? creditDays;

  String? location;

  int? routeId;
  int? provinceId;
  int? countryId;
  int? storeId;
  int? status;

  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  String? erpCustomerCode;

  int? priceGroupId;
  dynamic accountId;

  String? isCustomer;
  String? isSupplier;

  dynamic receivableGlId;
  dynamic payableGlId;
  dynamic salesmanId;

  CustomerData({
    this.id,
    this.name,
    this.code,
    this.address,
    this.building,
    this.flatNo,
    this.contactNumber,
    this.whatsappNumber,
    this.email,
    this.trn,
    this.custImage,
    this.paymentTerms,
    this.creditLimit,
    this.creditDays,
    this.location,
    this.routeId,
    this.provinceId,
    this.countryId,
    this.storeId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.erpCustomerCode,
    this.priceGroupId,
    this.accountId,
    this.isCustomer,
    this.isSupplier,
    this.receivableGlId,
    this.payableGlId,
    this.salesmanId,
  });

  factory CustomerData.fromJson(Map<String, dynamic> json) {
    return CustomerData(
      id: json['id'],
      name: json['name'],
      code: json['code'],
      address: json['address'],
      building: json['Building'],
      flatNo: json['Flat_no'],
      contactNumber: json['contact_number'],
      whatsappNumber: json['whatsapp_number'],
      email: json['email'],
      trn: json['trn'],
      custImage: json['cust_image'],
      paymentTerms: json['payment_terms'],
      creditLimit: json['credit_limit'],
      creditDays: json['credit_days'],
      location: json['location'],
      routeId: json['route_id'],
      provinceId: json['province_id'],
      countryId: json['country_id'],
      storeId: json['store_id'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      erpCustomerCode: json['erp_customer_code'],
      priceGroupId: json['price_group_id'],
      accountId: json['account_id'],
      isCustomer: json['is_customer'],
      isSupplier: json['is_supplier'],
      receivableGlId: json['receivable_gl_id'],
      payableGlId: json['payable_gl_id'],
      salesmanId: json['salesman_id'],
    );
  }
}
