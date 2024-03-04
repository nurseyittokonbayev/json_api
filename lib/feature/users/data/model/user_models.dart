class UserModels {
  UserModels({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    required this.phone,
  });
  final int id;
  final String name;
  final String userName;
  final String email;
  final String phone;

  factory UserModels.fromJson(Map<String, dynamic> json) {
    return UserModels(
      id: json['id'] as int,
      name: json['name'] as String,
      userName: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }
}
