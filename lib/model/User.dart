import 'dart:convert';


class User {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? category;

  User(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.password,
        this.category});

  User.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['category'] = this.category;
    return data;
  }
}