import 'dart:convert';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/structures/shift_data.dart';
import 'package:ftm_service_app/structures/user.dart';
import 'package:http/http.dart' as http;

// Future<User> fetchData() async {
//   String auth = 'GRZmuYwO9gJ1jate1ZnJem18Gnq5MwrH';
//   Uri uri = Uri.parse(URL + "/user?c=signin");
//   Map<String, String> headers = {
//     'Content-Type': 'application/json',
//     "mode": "safe",
//     "auth": auth
//   };
//   final response = await http.post(
//     uri,
//     headers: headers,
//     encoding: Encoding.getByName('utf-8'),
//   );
//
//   if (response.statusCode == 200) {
//     // in My project statusCode  = 200
//     print(response.body);
//     return User.fromJson(jsonDecode(response.body));
//   } else {
//     // If the server did not return a 201 CREATED response,
//     // then throw an exception.
//     String errorCode = response.statusCode.toString();
//     throw Exception('Failed to connect: $errorCode');
//   }
// }

Future<User> signInUser(
    {required String userName, required String password}) async {
  Uri uri = Uri.parse(URL + "/user?c=signin");
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    "mode": "safe"
  };
  final msg = jsonEncode({"username": userName, "password": password});

  final response = await http.post(
    uri,
    headers: headers,
    encoding: Encoding.getByName('utf-8'),
    body: msg,
  );

  if (response.statusCode == 200) {
    // in My project statusCode  = 200

    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception('Failed to connect: $errorCode');
  }
}

Future<ShiftData> setShiftData({
  required String auth,
  required ShiftData shiftData,

}) async {
  Uri uri = Uri.parse(URL + "/data?c=import");
  Map<String, String> headers = {
    "Content-Type" : "application/json",
    "mode" : "byApp",
    "auth" : auth
  };
  Map<String, Map<String, dynamic>> data = {
    'shiftData' : {
      'start_shift' : shiftData.start_shift,
      'end_shift' : shiftData.end_shift,
      'nozzle_1': shiftData.nozzle_1,
      'nozzle_2': shiftData.nozzle_2,
      'nozzle_3': shiftData.nozzle_3,
      'nozzle_4': shiftData.nozzle_4,
      'nozzle_5': shiftData.nozzle_5,
      'nozzle_6': shiftData.nozzle_6,
      'nozzle_7': shiftData.nozzle_7,
      'nozzle_8': shiftData.nozzle_8,
      'result_1': shiftData.result_1,
      'result_2': shiftData.result_2,
      'result_3': shiftData.result_3,
      'result_4': shiftData.result_4,
      'result_5': shiftData.result_5,
      'result_6': shiftData.result_6,
      'result_7': shiftData.result_7,
      'result_8': shiftData.result_8,
      'hand_cash' : shiftData.hand_cash,
      'card_cash' : shiftData.card_cash,
      'total_shift_cash' : shiftData.total_shift_cash,
      'total_shift_result' : shiftData.total_shift_result,
      'contradiction' : shiftData.contradiction,
      'confirm' : shiftData.confirm
    }
  };
  final msg = jsonEncode(data);

  final response = await http.post(
    uri,
    headers: headers,
    encoding: Encoding.getByName('utf-8'),
    body: msg
  );
  if (response.statusCode == 200) {
    // in My project statusCode  = 200
    return ShiftData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception('Failed to connect: $errorCode');
  }
}

Future<ShiftData> getShiftData({
  required String auth,
}) async {
  Uri uri = Uri.parse(URL + "/data?c=last");
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    "auth": auth
  };

  final response = await http.post(
    uri,
    headers: headers,
    encoding: Encoding.getByName('utf-8'),
  );
  if (response.statusCode == 200) {
    // in My project statusCode  = 200
    return ShiftData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception('Failed to connect: $errorCode');
  }
}
