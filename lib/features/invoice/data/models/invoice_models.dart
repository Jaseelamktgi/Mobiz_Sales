// invoice_model.dart

class InvoiceModel {
  InvoicePagination? data;
  bool? success;
  List<String>? messages;

  InvoiceModel({this.data, this.success, this.messages});

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      data: json['data'] != null
          ? InvoicePagination.fromJson(json['data'])
          : null,
      success: json['success'],
      messages: json['messages'] != null
          ? List<String>.from(json['messages'])
          : [],
    );
  }
}

class InvoicePagination {
  int? currentPage;
  List<InvoiceData>? data;

  InvoicePagination({this.currentPage, this.data});

  factory InvoicePagination.fromJson(Map<String, dynamic> json) {
    return InvoicePagination(
      currentPage: json['current_page'],
      data: json['data'] != null
          ? (json['data'] as List).map((e) => InvoiceData.fromJson(e)).toList()
          : [],
    );
  }
}

class InvoiceData {
  int? id;
  int? customerId;
  String? invoiceNo;
  String? inDate;
  String? inTime;
  dynamic total;
  dynamic roundOff;
  dynamic totalTax;
  dynamic grandTotal;
  String? remarks;

  InvoiceData({
    this.id,
    this.customerId,
    this.invoiceNo,
    this.inDate,
    this.inTime,
    this.total,
    this.roundOff,
    this.totalTax,
    this.grandTotal,
    this.remarks,
  });

  factory InvoiceData.fromJson(Map<String, dynamic> json) {
    return InvoiceData(
      id: json['id'],
      customerId: json['customer_id'],
      invoiceNo: json['invoice_no'],
      inDate: json['in_date'],
      inTime: json['in_time'],
      total: json['total'],
      roundOff: json['round_off'],
      totalTax: json['total_tax'],
      grandTotal: json['grand_total'],
      remarks: json['remarks'],
    );
  }
}

class InvoiceItem {
  final int id;
  final String code;
  final String name;
  final String type;
  final int productTypeId;
  final String unit;
  final int unitId;
  final int qty;
  final double rate;

  InvoiceItem({
    required this.id,
    required this.code,
    required this.name,
    required this.type,
    required this.productTypeId,
    required this.unit,
    required this.unitId,
    required this.qty,
    required this.rate,
  });

  double get amount => qty * rate;
}
