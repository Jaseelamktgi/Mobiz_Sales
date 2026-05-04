class UserDetailModel {
  List<UserDetailData>? data;
  bool? success;
  List<String>? messages;

  UserDetailModel({this.data, this.success, this.messages});

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      data: json['data'] != null
          ? (json['data'] as List)
                .map((e) => UserDetailData.fromJson(e))
                .toList()
          : [],
      success: json['success'],
      messages: json['messages'] != null
          ? List<String>.from(json['messages'])
          : [],
    );
  }
}

class UserDetailData {
  int? id;
  int? routeId;
  int? vanId;
  int? userId;
  int? storeId;

  UserDetailData({
    this.id,
    this.routeId,
    this.vanId,
    this.userId,
    this.storeId,
  });

  factory UserDetailData.fromJson(Map<String, dynamic> json) {
    return UserDetailData(
      id: json['id'],
      routeId: json['route_id'],
      vanId: json['van_id'],
      userId: json['user_id'],
      storeId: json['store_id'],
    );
  }
}
