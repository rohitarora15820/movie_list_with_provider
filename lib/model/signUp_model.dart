// ignore: file_names
import 'dart:convert';

class SignUpBody {
  String name;
  String phone;
  String email;
  String password;
  SignUpBody({
    required this.name,required this.phone,required this.email,required this.password
  });

   Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    };
  }

  factory SignUpBody.fromMap(Map<String, dynamic> map) {
    return SignUpBody(
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SignUpBody.fromJson(String source) => SignUpBody.fromMap(json.decode(source));
}
