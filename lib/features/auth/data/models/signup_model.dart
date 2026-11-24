class SignUpModel {
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final String birthDate;
  final List<String> interests;
  final String industry;
  final String businessDomain;
  final String jobTitle;
  final String companyName;
  SignUpModel({
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.birthDate,
    required this.interests,
    required this.industry,
    required this.businessDomain,
    required this.jobTitle,
    required this.companyName,
  });

  SignUpModel copyWith({
    String? username,
    String? email,
    String? password,
    String? phoneNumber,
    String? birthDate,
    List<String>? interests,
    String? industry,
    String? businessDomain,
    String? jobTitle,
    String? companyName,
  }) => SignUpModel(
    username: username ?? this.username,
    email: email ?? this.email,
    password: password ?? this.password,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    birthDate: birthDate ?? this.birthDate,
    interests: interests ?? this.interests,
    industry: industry ?? this.industry,
    businessDomain: businessDomain ?? this.businessDomain,
    jobTitle: jobTitle ?? this.jobTitle,
    companyName: companyName ?? this.companyName,
  );
  Map<String, dynamic> toJson() => {
    "fullName": username,
    "email": email,
    "password": password,
    " phoneNumber ": phoneNumber,
    "birthDate": birthDate,
    "interests": interests,
    "industry": industry,
    "businessDomain": businessDomain,
    "jobTitle": jobTitle,
    "companyName": companyName,
  };
}
