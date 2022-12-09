// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers, no_logic_in_create_state

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/pages/LandingPage.dart';
import 'package:trashsure/pages/user/WithdrawPage.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/pages/user/RedeemPrizePage.dart';
import 'package:trashsure/pages/user/DepositPage.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, required this.idx});
  final int idx;

  @override
  State<UserPage> createState() => _UserPageState(idx);
}

class _UserPageState extends State<UserPage> {
  _UserPageState(this._selectedIndex);
  int _selectedIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    List<Widget> _widgetOptions = <Widget>[
      LandingPage(),
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
                      .logout("http://103.13.207.170/flutter/logout/")
                      .then((value) => {
                            if (value['status'] == 200)
                              {
                                Navigator.pushReplacementNamed(
                                    context, "/landing"),
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
