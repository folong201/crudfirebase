import 'dart:convert';

class User {
  String name;
  int age;
  String id;
  User({this.id = '', required this.name, required this.age});

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'age': age};
  }

  factory User.FromJon(Map<String, dynamic> json) {
    return User(id: json['id'], name: json['name'], age: json['age']);
  }
}
