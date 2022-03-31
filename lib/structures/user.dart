class User {
  late int? id;
  late String? firstName;
  late String? lastName;
  late String? userId;
  late String? phone;
  late String? personnelId;
  late String? password;
  late String? role;
  late String? stateId;
  late String? userDetail;
  late String? token;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.userId,
      this.phone,
      this.personnelId,
      this.password,
      this.role,
      this.stateId,
      this.userDetail,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['info']['id'],
      firstName: json['info']['first_name'],
      lastName: json['info']['last_name'],
      userId: json['info']['user_id'],
      phone: json['info']['phone'],
      role: json['info']['role'],
      stateId: json['info']['state_id'],
      userDetail: json['info']['user_detail'],
      personnelId: json['info']['personnel_id'],
      password: json['info']['password'],
      token: json['token'],
    );
  }

  String getRole(){
    String _role = "";

    if(role == "master"){
      _role = "مدیر";
  }else if (role == "operator"){
      _role = "اپراتور";
  }
    return _role;
  }
}

