import 'dart:convert';
import 'package:ftm_service_app/structures/user.dart';
import 'package:http/http.dart' as http;


Future<User> fetchUser() async {
  final response =
      await http.get(Uri.parse('https://app.srahmadi.ir/getuser.php'));

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

Future<User> createUser(String phone) async {
  final response = await http.post(
    Uri.parse('https://app.srahmadi.ir/usersignup.php'),
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
    body: <String, String>{
      'operator': "Ali",
      'phone': phone,
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
    throw Exception('Failed to create user: $errorCode');
  }
}
