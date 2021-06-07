// @dart=2.9
class UserModel {
  int id;
  String name, phone, email, pass, address, department, userType;

  UserModel(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.address,
      this.department,
      this.pass,
      this.userType});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      pass: json['pass'] as String,
      address: json['address'] as String,
      department: json['department'] as String,
      userType: json['userType'] as String,
    );
  }
}
