// ignore_for_file: file_names, prefer_const_constructors

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/pages/WithdrawPage.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/pages/RedeemPrizePage.dart';
import 'package:trashsure/pages/DepositPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.idx});
  final int idx;

  @override
  State<UserPage> createState() => _UserPageState(idx);
}

class _UserPageState extends State<UserPage> {
  _UserPageState(this._selectedIndex);
  int _selectedIndex;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    List<Widget> _widgetOptions = <Widget>[
      Text(
        'Index 0: Home',
        style: optionStyle,
      ),
      DepositPage(),
      // NOTE: Redeem Prize Page
      RedeemPrizePage(),
      WithdrawPage(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: GestureDetector(
            child: IconButton(
              icon: const Icon(
                Icons.autorenew,
                color: Colors.black,
              ),
              onPressed: () {
                // do something
              },
            ),
          ),
          title: SizedBox(
              // App Logo in the middle of AppBar
              width: 35,
              child: Image.asset("lib/assets/bin.png")),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              child: IconButton(
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                onPressed: () async {
                  // do something
                  final response = await request
                      .logout("http://10.0.2.2:8000/flutter/logout/")
                      .then((value) => {
                            Navigator.pop(context),
                            if (value['status'] == 200)
                              {
                                Flushbar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 29, 167, 86),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  title: "Berhasil",
                                  duration: const Duration(seconds: 3),
                                  message: "Berhasil logout",
                                ).show(context)
                              }
                            else
                              {
                                Flushbar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 244, 105, 77),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  title: "Gagal",
                                  duration: const Duration(seconds: 3),
                                  message: "Ada yang salah",
                                ).show(context)
                              }
                          });
                  if (request.loggedIn) {
                    // Code here will run if the login succeeded.
                    print("yes");
                  } else {
                    print("no");
                    // Code here will run if the login failed (wrong username/password).
                  }
                },
              ),
            ),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_delete),
              label: 'Deposit',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Prize',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_atm),
              label: 'Withdraw',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black,
          selectedItemColor: const Color.fromARGB(255, 5, 89, 91),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
