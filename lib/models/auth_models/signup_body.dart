class SignUpBody {
  String? email;
  String? password;
  String? fName;
  String? lName;
  String? phone;

  /// Other fields to be added as well.
  SignUpBody({
    this.email,
    this.password,
    this.fName,
    this.lName,
    this.phone,
  });

  toJson() {
    return {
      'first_name': fName,
      'last_name': lName,
      'email': email,
      'contact_number': phone,
      'password': password,
    };
  }

  toJsonForUpdate() {
    return {
      'name': "$fName",
      'email': email,
      'contact_number': phone,
    };
  }
}
