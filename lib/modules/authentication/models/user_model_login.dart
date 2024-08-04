class UserModelLogin {
  String email;
  String password;

  UserModelLogin({required this.email, required this.password});

  // Optionally, add methods for JSON serialization/deserialization
}

class UserFullName {
  String firstName;
  String lastName;

  UserFullName({required this.firstName, required this.lastName});
}
