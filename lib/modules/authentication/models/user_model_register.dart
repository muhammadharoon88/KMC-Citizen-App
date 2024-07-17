class UserModelRegister {
  String firstName;
  String lastName;
  String email;
  String createPassword;
  String confirmPassword;
  String gender;

  UserModelRegister({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.createPassword,
    required this.confirmPassword,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'createPassword': createPassword,
      'confirmPassword': confirmPassword,
      'gender': gender,
    };
  }
}
