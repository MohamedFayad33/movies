import 'package:movies_app/modules/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? name;
  final String email;
  final String? password;
  final String? confirmPassword;
  final String? phone;
  final num? avaterId;

  const UserModel({
    this.name,
    required this.email,
    this.password,
    this.confirmPassword,
    this.phone,
    this.avaterId,
  }) : super(
         userName: name,
         userEmail: email,
         userPhone: phone,
         userAvaterId: avaterId,
       );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['data']['email'] as String,
      name: json['data']['name'] as String,
      phone: json['data']['phone'] as String,
      avaterId: json['data']['avaterId'] as num,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phone': phone,
      'avaterId': avaterId,
    };
  }
}
