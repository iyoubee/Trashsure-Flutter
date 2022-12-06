import 'package:flutter/material.dart';
import 'package:trashsure/pages/LandingPage.dart';
import 'package:trashsure/pages/WithdrawAddPage.dart';
import 'package:trashsure/pages/about_trashsure.dart';
import 'package:trashsure/pages/fitur_trashsure.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/components/drawer.dart';
import 'package:trashsure/pages/AdminAddDepositPage.dart';
import 'package:trashsure/pages/AdminAddPrizePage.dart';
import 'package:trashsure/pages/AdminPage.dart';
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
          primarySwatch: Colors.green,
        ),
        home: const LandingPage(),
        routes: {
          "/admin": (BuildContext context) => const AdminPage(idx: 0),
          "/admin/deposit/add": (BuildContext context) =>
              const AdminAddDepositPage(),
          "/admin/prize/add": (BuildContext context) =>
              const AdminAddPrizePage(),
          "/login": (BuildContext context) => const LoginPage(),
          "/register": (BuildContext context) => const RegisterPage(),
          "/user": (BuildContext context) => const UserPage(idx: 0),
          "/user/withdraw/add": (BuildContext context) =>
              const WithdrawAddPage(),
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text("TrashSure"),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: "Tentang Kita"),
                Tab(text: "Fitur"),
                Tab(text: "Testimoni")
              ],
            ),
          ),
          drawer: const DrawerCustom(),
          body: TabBarView(
            children: [
              AboutTrashsure(),
              FiturTrashsure(),
              Center(
                  child: Text(
                      "Kasih Testimonial TrashSure")), // sesuaikan isi dengan length
            ],
          )),
    );
  }
}
