// ignore_for_file: unused_import
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:project_bekery/screen/admin_import_product.dart';
import 'package:project_bekery/screen/admin_orderlist.dart';
import 'package:project_bekery/screen/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:project_bekery/screen/rider_allorder.dart';
import 'package:project_bekery/screen/user_order.dart';
import 'dart:io' show Platform;
import 'package:shared_preferences/shared_preferences.dart';

import 'login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // Replace with actual values
      /*options: const FirebaseOptions(
      apiKey: "AIzaSyAj4GhdAQFlNLhNLv5DpvR6vCDUiaxFBWM",
      appId: "1:139664672802:web:1f61439e6d98a839d1a27b",
      messagingSenderId: "139664672802",
      projectId: "bakery203",
    ),*/
      );

  final prefs = await SharedPreferences.getInstance();
  final String? email = prefs.getString('email');
  final String? role = prefs.getString('role');

  email == null && role == null
      ? runApp(const MyApp())
      : email != null && role == 'customer'
          ? {
              SessionManager().set("email", '${email}'),
              runApp(const MyAppuser())
            }
          : email != null && role == 'rider'
              ? {
                  SessionManager().set("email", '${email}'),
                  runApp(const MyApprider())
                }
              : email != null && role == 'admin'
                  ? {
                      SessionManager().set("email", '${email}'),
                      runApp(const MyAppadmin())
                    }
                  : runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LoginPage());
  }
}

class MyAppuser extends StatelessWidget {
  const MyAppuser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Orderpage());
  }
}

class MyApprider extends StatelessWidget {
  const MyApprider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: rider_allorder());
  }
}

class MyAppadmin extends StatelessWidget {
  const MyAppadmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: admin_orderlist());
  }
}
