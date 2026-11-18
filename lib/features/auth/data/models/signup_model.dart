class SignUpModel {
  final String? username;
  final String? email;
  final String? password;
  final String? phoneNumber;

  SignUpModel({this.username, this.email, this.password, this.phoneNumber});

  SignUpModel copyWith({
    String? username,
    String? email,
    String? password,
    String? phoneNumber,
  }) => SignUpModel(
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    phoneNumber: phoneNumber ?? this.phoneNumber,
  );
}
