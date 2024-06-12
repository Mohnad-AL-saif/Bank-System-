class User1 {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? creditCardNumber;
  String? money;

  User1(
      {this.id,
      this.name,
      this.email,
      this.phoneNumber,
      this.password,
      this.money,
      this.creditCardNumber});

  factory User1.fromJson(Map<String, dynamic> json) {
    return User1(
      id: json['id'],
      name: json['names'],
      password: json['password'],
      email: json['email'],
      phoneNumber: json['phone'],
      creditCardNumber: json['creditCardNumber'],
      // money: json['money'],
    );
  }

  Map<String, dynamic> toJsonUs() {
    return {
      "id": id,
      "names": name,
      "email": email,
      "phone": phoneNumber,
      "password": password,
      "creditCardNumber": creditCardNumber,
    };
  }

  Map<String, dynamic> toJsonAc() {
    return {
      "user_id": id,
      "password": password,
      "CardNumber": creditCardNumber,
      "money": money,
    };
  }

  // Map<String, dynamic> toJsonAcs() {
  //   return {
  //     "user_id": id,
  //     "password": password,
  //     "CardNumber": creditCardNumber,
  //   };
  // }

  Map<String, dynamic> toJsonBeneficiary() {
    return {
      "Beneficiary": id,
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
