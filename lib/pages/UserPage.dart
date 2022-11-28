// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trashsure/pages/RedeemPrizePage.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Text(
        'Index 0: Home',
        style: optionStyle,
      ),
      Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            tooltip: 'Add Deposit',
            backgroundColor: Color.fromARGB(255, 5, 89, 91),
            child: Icon(Icons.add),
          )),
      // NOTE: Redeem Prize Page
      RedeemPrizePage(),
      Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            tooltip: 'Add Deposit',
            backgroundColor: Color.fromARGB(255, 5, 89, 91),
            child: Icon(Icons.add),
          ))
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
                onPressed: () {
                  // do something
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
          selectedItemColor: const Color.fromARGB(255, 226, 215, 132),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
