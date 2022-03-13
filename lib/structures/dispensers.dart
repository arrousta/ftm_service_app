class Dispensers {
  Dispensers(
      {this.id,
      this.dis_1,
      this.dis_2,
      this.dis_3,
      this.dis_4,
      this.dis_5,
      this.dis_6});

  late String? id = "nullly";
  late String? dis_1 = "nullly";
  late String? dis_2 = "nullly";
  late String? dis_3 = "nullly";
  late String? dis_4 = "nullly";
  late String? dis_5 = "nullly";
  late String? dis_6 = "nullly";


  factory Dispensers.fromJson(Map<String, dynamic> json) {
    return Dispensers(
      id: json['id'],
      dis_1: json['dis_1'],
      dis_2: json['dis_2'],
      dis_3: json['dis_3'],
      dis_4: json['dis_4'],
      dis_5: json['dis_5'],
      dis_6: json['dis_6'],

    );
  }

}



