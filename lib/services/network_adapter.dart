import 'dart:convert';
import 'package:ftm_service_app/structures/dispensers.dart';
import 'package:ftm_service_app/structures/user.dart';
import 'package:http/http.dart' as http;

Future<User> fetchData({required String url}) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load User');
  }
}

Future<User> signInUser(
    {required String url,
    required String userName,
    required String password}) async {
  final response = await http.post(
    Uri.parse(url),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: <String, String>{
      'username': userName,
      'password': password,
    },
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 200) {
    // in My project statusCode  = 200
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception('Failed to connect: $errorCode');
  }
}

Future<Dispensers> setShiftData({
  required String url,
  required String user,
  required String dis_1,
  required String dis_2,
  required String dis_3,
  required String dis_4,
  required String dis_5,
  required String dis_6,
  required String hcash,
  required String ccash,
  required String total_cash,
  required String sum_dis,
}) async {
  final response = await http.post(
    Uri.parse(url),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: <String, String>{
      'user': user,
      'dis_1': dis_1,
      'dis_2': dis_2,
      'dis_3': dis_3,
      'dis_4': dis_4,
      'dis_5': dis_5,
      'dis_6': dis_6,
      'sum_dis': sum_dis,
      'hcash': hcash,
      'ccash': ccash,
      'total_cash': total_cash,
    },
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Dispensers.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 200) {
    // in My project statusCode  = 200
    return Dispensers.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception('Failed to connect: $errorCode');
  }
}

Future<Dispensers> getDispenserData({
  required String url,
  required String id,
}) async {
  final response = await http.post(
    Uri.parse(url),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: <String, String>{
      'id': id,
    },
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    return Dispensers.fromJson(jsonDecode(response.body));
  } else if (response.statusCode == 200) {
    // in My project statusCode  = 200
    return Dispensers.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    String errorCode = response.statusCode.toString();
    throw Exception('Failed to connect: $errorCode');
  }
}
