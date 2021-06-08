// @dart=2.9
class UserModel {
  final Map<String, dynamic> data;
  final String id;
  final String name;
  final String phone;
  final String email;
  final String pass;
  final String address;
  final String department;
  final String userType;

  UserModel(
      {this.data,
        this.id,
        this.name,
        this.phone,
        this.email,
        this.pass,
        this.address,
        this.department,
        this.userType,
      });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      data: {
        'id': json['id'],
        'name': json['name'],
        'phone': json['phone'],
        'email': json['email'],
        'pass': json['pass'],
        'address': json['address'],
        'department': json['department'],
        'userType': json['userType'],
      },
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      pass: json['pass'],
      address: json['address'],
      department: json['department'],
      userType: json['userType'],
    );
  }
}