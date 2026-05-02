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
  int? storeId;

  User({this.id, this.name, this.email, this.storeId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      storeId: json['store_id'],
    );
  }
}

class Settings {
  int? id;
  int? storeId;

  Settings({this.id, this.storeId});

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(id: json['id'], storeId: json['store_id']);
  }
}
