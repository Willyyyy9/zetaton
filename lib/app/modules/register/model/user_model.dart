class UserModel {
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;

  UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "first_name": firstName,
      "last_name": lastName,
      "phone_number": phoneNumber,
    };
  }

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      email: json["email"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      phoneNumber: json["phone_number"],
    );
  }
}
