import 'package:flutter/material.dart';
import 'package:trashsure/pages/SplashPage.dart';
import 'pages/LoginPage.dart';
import 'pages/RegisterPage.dart';
import 'package:trashsure/pages/LandingPage.dart';
import 'package:trashsure/pages/user/WithdrawAddPage.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/pages/admin/AdminAddDepositPage.dart';
import 'package:trashsure/pages/admin/AdminAddPrizePage.dart';
import 'package:trashsure/pages/admin/AdminPage.dart';
import 'package:trashsure/pages/user/UserPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: "/splash",
        routes: {
          "/splash": (BuildContext context) => const SplashPage(),
          "/landing": (BuildContext context) => const LandingPage(),
          "/admin": (BuildContext context) => const AdminPage(idx: 1),
          "/admin/deposit/add": (BuildContext context) =>
              const AdminAddDepositPage(),
          "/admin/prize/add": (BuildContext context) =>
              const AdminAddPrizePage(),
          "/login": (BuildContext context) => const LoginPage(),
          "/register": (BuildContext context) => const RegisterPage(),
          "/user": (BuildContext context) => const UserPage(idx: 1),
          "/user/withdraw/add": (BuildContext context) =>
              const WithdrawAddPage(),
        },
      ),
    );
  }
}
