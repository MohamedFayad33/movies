class RegisterUser {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final num avaterId;

  const RegisterUser({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.avaterId,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) {
    return RegisterUser(
      email: json['data']['email'] as String,
      name: json['data']['name'] as String,
      phone: json['data']['phone'] as String,
      avaterId: json['data']['avaterId'] as num,
      password: json['data']['password'] as String,
      confirmPassword: json['data']['confirmPassword'] as String,
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
