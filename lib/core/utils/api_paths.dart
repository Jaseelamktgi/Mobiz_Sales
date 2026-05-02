abstract class ApiPaths {
  ///=======================[Base URL]==================================
  static const String baseUrl = 'http://142.93.214.133:3641/api/';

  ///=======================[Auth]==================================
  static const String login = 'login';

  ///=======================[User]==================================
  static const String getUserDetail = 'get_user_detail';

  ///=======================[Customer]==================================
  static const String getCustomer = 'get_customer';

  ///=======================[Product]==================================
  static const String getProduct = 'get_product';
  static const String getProductType = 'get_product_type';
  static const String getProductDetail = 'get_product_detail';

  ///=======================[Van Sale]==================================
  static const String createVanSale = 'vansale.store';
  static const String getVanSaleList = 'vansale.index';
}
