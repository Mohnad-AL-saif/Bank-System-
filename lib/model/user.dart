class User1 {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;

  User1({this.id, this.name, this.email, this.phoneNumber, this.password});

  factory User1.fromJson(Map<String, dynamic> json) {
    return User1(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phoneNumber,
      "password": password,
    };
  }

  factory User1.fromMap(Map<String, dynamic> map) {
    return User1(
      id: map['id'] as String?,
      name: map['name'] as String?,
      email: map['email'] as String?,
    );
  }
}
