import 'package:flutter/material.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/components/drawer.dart';
import 'package:trashsure/pages/AdminAddDepositPage.dart';
import 'package:trashsure/pages/AdminAddPrizePage.dart';
import 'package:trashsure/pages/AdminPage.dart';
import 'package:trashsure/pages/Auth/AdminLoginPage.dart';
import 'package:trashsure/pages/Auth/AdminRegisterPage.dart';
import 'package:trashsure/pages/Auth/LoginPage.dart';
import 'package:trashsure/pages/Auth/RegisterPage.dart';
import 'package:trashsure/pages/UserPage.dart';

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
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter App'),
        routes: {
          "/admin": (BuildContext context) => const AdminPage(idx: 0),
          "/admin/deposit/add": (BuildContext context) =>
              const AdminAddDepositPage(),
          "/admin/prize/add": (BuildContext context) =>
              const AdminAddPrizePage(),
          "/admin/login": (BuildContext context) => const AdminLoginPage(),
          "/admin/register": (BuildContext context) =>
              const AdminRegisterPage(),
          "/login": (BuildContext context) => const LoginPage(),
          "/register": (BuildContext context) => const RegisterPage(),
          "/user": (BuildContext context) => const UserPage(),
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter Tugas 7 PBP"),
        ),
        drawer: const DrawerCustom(),
        body: null);
  }
}
