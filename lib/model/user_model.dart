// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  int password;
  String username;
  UserModel({
    required this.password,
    required this.username,
  });

  UserModel copyWith({
    int? password,
    String? username,
  }) {
    return UserModel(
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'username': username,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      password: map['password'] as int,
      username: map['username'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(password: $password, username: $username)';

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.password == password && other.username == username;
  }

  @override
  int get hashCode => password.hashCode ^ username.hashCode;
}
