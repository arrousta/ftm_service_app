class DataStructures {
  late var userId;
  late var firstName;
  late var lastName;
  late var phone;
  late var personnelId;
  late var password;
  late var role;
  late var state;
  late var userDetail;
  late var token;
  late var startShift;
  late var endShift;
  late var nozzle1start;
  late var nozzle2start;
  late var nozzle3start;
  late var nozzle4start;
  late var nozzle5start;
  late var nozzle6start;
  late var nozzle7start;
  late var nozzle8start;
  late var nozzle1;
  late var nozzle2;
  late var nozzle3;
  late var nozzle4;
  late var nozzle5;
  late var nozzle6;
  late var nozzle7;
  late var nozzle8;
  late var result1;
  late var result2;
  late var result3;
  late var result4;
  late var result5;
  late var result6;
  late var result7;
  late var result8;
  late var totalShiftResult;
  late var handCash;
  late var cardCash;
  late var totalShiftCash;
  late var flag;
  late var confirm;
  late var saveDate;
  late var saveDataResult;
  late var serverDate;
  late var shiftStatus;
  late var error;

  DataStructures(
      {
        this.firstName,
        this.lastName,
        this.userId,
        this.phone,
        this.personnelId,
        this.password,
        this.role,
        this.state,
        this.userDetail,
        this.token,
        this.error,
        this.startShift,
        this.endShift,
        this.nozzle1,
        this.nozzle2,
        this.nozzle3,
        this.nozzle4,
        this.nozzle5,
        this.nozzle6,
        this.nozzle7,
        this.nozzle8,
        this.nozzle1start,
        this.nozzle2start,
        this.nozzle3start,
        this.nozzle4start,
        this.nozzle5start,
        this.nozzle6start,
        this.nozzle7start,
        this.nozzle8start,
        this.result1,
        this.result2,
        this.result3,
        this.result4,
        this.result5,
        this.result6,
        this.result7,
        this.result8,
        this.totalShiftResult,
        this.handCash,
        this.cardCash,
        this.totalShiftCash,
        this.flag,
        this.confirm,
        this.saveDate,
        this.saveDataResult,
        this.serverDate,
        this.shiftStatus,
      });

  factory DataStructures.fromJson(Map<String, dynamic> json) {
    return DataStructures(
      serverDate: json['serverDate'],
      userId: json['info']['user_id'],
      firstName: json['info']['first_name'],
      lastName: json['info']['last_name'],
      phone: json['info']['phone'],
      role: json['info']['role'],
      userDetail: json['info']['user_detail'],
      personnelId: json['info']['personnel_id'],
      password: json['info']['password'],
      state: json['state']['state_name'],
      token: json['token'],
      shiftStatus: json['shift']['shiftStatus'],
      startShift: json['shift']['shift']['start_shift'],
      endShift: json['shift']['shift']['end_shift'],
      nozzle1start: json['shift']['shift']['nozzle_1'],
      nozzle2start: json['shift']['shift']['nozzle_2'],
      nozzle3start: json['shift']['shift']['nozzle_3'],
      nozzle4start: json['shift']['shift']['nozzle_4'],
      nozzle5start: json['shift']['shift']['nozzle_5'],
      nozzle6start: json['shift']['shift']['nozzle_6'],
      result1: json['shift']['shift']['result_1'],
      result2: json['shift']['shift']['result_2'],
      result3: json['shift']['shift']['result_3'],
      result4: json['shift']['shift']['result_4'],
      result5: json['shift']['shift']['result_5'],
      result6: json['shift']['shift']['result_6'],
      totalShiftResult: json['shift']['shift']['total_shift_result'],
      handCash: json['shift']['hand_cash'],
      cardCash: json['shift']['shift']['card_cash'],
      totalShiftCash: json['shift']['shift']['total_shift_cash'],
      flag: json['shift']['shift']['flag'],
      confirm: json['shift']['shift']['confirm'],
      saveDate: json['shift']['shift']['save_date'],

      saveDataResult: json['shift'],
      error: json['err'],
    );
  }

  String getRole(){
    String _role = "";

    if(role == "master"){
      _role = "سرپرست";
    }else if (role == "operator"){
      _role = "اپراتور";
    }
    return _role;
  }
}

