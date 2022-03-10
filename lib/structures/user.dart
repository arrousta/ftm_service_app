class User {
  late String? id = "nullly";
  late String? name = "nullly";
  late String? family = "nullly";
  late String? userId = "nullly";
  late String? phone = "nullly";
  late String? personnelId = "nullly";
  late String? password = "nullly";
  late String? role = "nullly";
  late String? state = "nullly";

  User(
      {this.id,
      this.name,
      this.family,
      this.userId,
      this.phone,
      this.personnelId,
      this.password,
      this.role,
      this.state});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        family: json['family'],
        userId: json['user_id'],
        phone: json['phone'],
        personnelId: json['personnel_id'],
        password: json['password'],
        role: json['role'],
        state: json['state']);
  }
}
