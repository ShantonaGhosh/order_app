import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:quadeye/common/global_variable.dart';
import 'package:quadeye/view/app_routes_screen.dart';
import 'package:quadeye/view/login_screen.dart';

import '../view/home_screen.dart';

class AuthService {
  var loginData = Hive.box('login');
  var isLoading = true;

  Future login({
    String? userId,
    String? userPass,
    context,
  }) async {
    try {
      isLoading = true;

      String url = '${appBaseUrl}auth/loginByEmail';
      if (kDebugMode) {
        print('login url :----$url');
      }

      var response = await http.post(Uri.parse(url),
          body: {"username": userId, "password": userPass});
      if (kDebugMode) {
        print('Response data :----${response.body}');
      }

      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        if (data['message'] == "Login successful") {
          loginData.clear();
          loginData.put('userId', userId);
          loginData.put('userPass', userPass);
          Map<String, dynamic> userData = data['user'];

          // final userBox = await Hive.openBox('userBox');
          loginData.put('username', userData['username'].toString());
          loginData.put('user_id', userData['user_id'].toString());
          loginData.put('role_id', userData['role_id'].toString());
        loginUserName = loginData.get('username') ?? '';
    loginUserIdU = loginData.get('user_id') ?? '';
    loginUserRoleId = loginData.get('role_id') ?? '';
    print('---------login name--------------${loginUserName}');

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppRouteScreen()),
          );
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5.0),
                right: Radius.circular(5.0),
              )),
              content: Text(data['message'].toString())));
          // await isUserLogin();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(data['message'].toString())));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Connection error')));
      }
    } finally {
      isLoading = false;
    }
  }

  Future<void> logOut({context}) async {
    try {
      await Hive.box('login').clear();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LogInScreen()),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
