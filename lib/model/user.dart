class User1 {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? creditCardNumber;
  User1(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.password,
      this.creditCardNumber});

  factory User1.fromJson(Map<String, dynamic> json) {
    return User1(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone'],
      password: json['password'],
      creditCardNumber: json['creditCardNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phoneNumber,
      "password": password,
      "creditCardNumber": creditCardNumber,
    };
  }

  factory User1.fromMap(Map<String, dynamic> map) {
    return User1(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }
}
