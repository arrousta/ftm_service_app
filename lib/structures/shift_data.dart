class ShiftData {
  late String? id;
  late String? user;
  late String? state_id;
  late String? start_shift;
  late String? end_shift;
  late String? nozzle_1;
  late String? nozzle_2;
  late String? nozzle_3;
  late String? nozzle_4;
  late String? nozzle_5;
  late String? nozzle_6;
  late String? nozzle_7;
  late String? nozzle_8;
  late String? result_1;
  late String? result_2;
  late String? result_3;
  late String? result_4;
  late String? result_5;
  late String? result_6;
  late String? result_7;
  late String? result_8;
  late String? total_shift_result;
  late String? hand_cash;
  late String? card_cash;
  late String? total_shift_cash;
  late String? contradiction;
  late String? confirm;
  late String? save_date;

  ShiftData(
      {this.id,
      this.user,
      this.state_id,
      this.start_shift,
      this.end_shift,
      this.nozzle_1,
      this.nozzle_2,
      this.nozzle_3,
      this.nozzle_4,
      this.nozzle_5,
      this.nozzle_6,
      this.nozzle_7,
      this.nozzle_8,
      this.result_1,
      this.result_2,
      this.result_3,
      this.result_4,
      this.result_5,
      this.result_6,
      this.result_7,
      this.result_8,
      this.total_shift_result,
      this.hand_cash,
      this.card_cash,
      this.total_shift_cash,
      this.contradiction,
      this.confirm,
      this.save_date});

  factory ShiftData.fromJson(Map<String, dynamic> json) {
    return ShiftData(
      id: json['id'],
      user: json['user'],
      state_id: json['state_id'],
      start_shift: json['start_shift'],
      end_shift: json['end_shift'],
      nozzle_1: json['nozzle_1'],
      nozzle_2: json['nozzle_2'],
      nozzle_3: json['nozzle_3'],
      nozzle_4: json['nozzle_4'],
      nozzle_5: json['nozzle_5'],
      nozzle_6: json['nozzle_6'],
      nozzle_7: json['nozzle_7'],
      nozzle_8: json['nozzle_8'],
      result_1: json['result_1'],
      result_2: json['result_2'],
      result_3: json['result_3'],
      result_4: json['result_4'],
      result_5: json['result_5'],
      result_6: json['result_6'],
      result_7: json['result_7'],
      result_8: json['result_8'],
      total_shift_result: json['total_shift_result'],
      hand_cash: json['hand_cash'],
      card_cash: json['card_cash'],
      total_shift_cash: json['total_shift_cash'],
      contradiction: json['contradiction'],
      confirm: json['confirm'],
      save_date: json['save_date'],
    );
  }
}
