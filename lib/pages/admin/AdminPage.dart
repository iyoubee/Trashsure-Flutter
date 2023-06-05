// ignore_for_file: file_names, prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers, no_logic_in_create_state

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/pages/LandingPage.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/pages/admin/AdminDepositPage.dart';
import 'package:trashsure/pages/admin/AdminPrizePage.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key, required this.idx});
  final int idx;

  @override
  State<AdminPage> createState() => _AdminPageState(idx);
}

class _AdminPageState extends State<AdminPage> {
  _AdminPageState(this._selectedIndex);

  int _selectedIndex;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_final_fields
    final request = context.watch<CookieRequest>();

    List<Widget> _widgetOptions = <Widget>[
      LandingPage(),
      AdminDepositPage(),
      AdminPrizePage()
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        title: _selectedIndex == 0
            ? Text(
                "Home",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 5, 89, 91),
                ),
              )
            : _selectedIndex == 1
                ? Text(
                    "Deposit List",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 5, 89, 91),
                    ),
                  )
                : Text(
                    "Prize List",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 5, 89, 91),
                    ),
                  ),
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
              setState(() {});
            },
          ),
        ),
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
                    .logout("https://trashsure.iyoubee.xyz/flutter/logout/")
                    .then((value) => {
                          if (value['status'] == 200)
                            {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, "/landing", (route) => false),
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 5, 89, 91),
        onTap: _onItemTapped,
      ),
    );
  }
}
