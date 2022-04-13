import 'dart:convert';
import 'package:ftm_service_app/constructor.dart';
import 'package:ftm_service_app/structures/data_structures.dart';
import 'package:http/http.dart' as http;

Future<DataStructures> connect(
    {String userName = '', String password = '', String auth = ''}) async {
  Uri uri = Uri.parse(URL + "/signin/safe");
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'auth': auth,
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
    // print(response.body);
    return DataStructures.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception('Failed to connect: $errorCode');
  }
}

Future<dynamic> start({String auth = ''}) async {
  Uri uri = Uri.parse(URL + "/shifts?c=change");
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'auth': auth,
  };

  final response = await http.post(
    uri,
    headers: headers,
    encoding: Encoding.getByName('utf-8'),
  );

  if (response.statusCode == 200) {
    // in My project statusCode  = 200
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception('Failed to connect: $errorCode');
  }
}

Future<dynamic> contradiction({
  String auth = '',
  required DataStructures data,
}) async {
  Uri uri = Uri.parse(URL + "/shifts?c=change");
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'auth': auth,
  };
  Map<String, Map<String, dynamic>> contradiction = {
    'contradiction': {
      'nozzle_1': data.nozzle1,
      'nozzle_2': data.nozzle2,
      'nozzle_3': data.nozzle3,
      'nozzle_4': data.nozzle4,
      'nozzle_5': data.nozzle5,
      'nozzle_6': data.nozzle6,
    }
  };

  final msg = jsonEncode(contradiction);

  final response = await http.post(
    uri,
    headers: headers,
    encoding: Encoding.getByName('utf-8'),
    body: msg,
  );

  if (response.statusCode == 200) {
    // in My project statusCode  = 200
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception('Failed to connect: $errorCode');
  }
}

Future<dynamic> sendData({
  required String auth,
  required DataStructures shiftData,
}) async {
  Uri uri = Uri.parse(URL + "/shifts?c=change");
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "auth": auth
  };
  Map<String, dynamic> data = {
      'nozzle_1': shiftData.nozzle1,
      'nozzle_2': shiftData.nozzle2,
      'nozzle_3': shiftData.nozzle3,
      'nozzle_4': shiftData.nozzle4,
      'nozzle_5': shiftData.nozzle5,
      'nozzle_6': shiftData.nozzle6,
      'nozzle_7': shiftData.nozzle7,
      'nozzle_8': shiftData.nozzle8,
      'result_1': shiftData.result1,
      'result_2': shiftData.result2,
      'result_3': shiftData.result3,
      'result_4': shiftData.result4,
      'result_5': shiftData.result5,
      'result_6': shiftData.result6,
      'result_7': shiftData.result7,
      'result_8': shiftData.result8,
      'hand_cash': shiftData.handCash,
      'card_cash': shiftData.cardCash,
      'total_shift_cash': shiftData.totalShiftCash,
      'total_shift_result': shiftData.totalShiftResult,
  };
  final msg = jsonEncode(data);

  final response = await http.post(uri,
      headers: headers, encoding: Encoding.getByName('utf-8'), body: msg);
  if (response.statusCode == 200) {
    // in My project statusCode  = 200
    print(response.body);
    return jsonDecode(response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception('Failed to connect: $errorCode');
  }
}
