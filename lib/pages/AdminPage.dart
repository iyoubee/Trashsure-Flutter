// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trashsure/components/card_deposit.dart';
import 'package:trashsure/components/card_prize.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
    // ignore: prefer_final_fields
    List<Widget> _widgetOptions = <Widget>[
      Text(
        'Index 0: Home',
        style: optionStyle,
      ),
      Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: CardDeposit(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
              Navigator.pushNamed(context, '/admin/deposit/add');
            },
            tooltip: 'Add Deposit',
            backgroundColor: Color.fromARGB(255, 5, 89, 91),
            child: Icon(Icons.add),
          )),
      Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 245, 245),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: CardPrize(),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            tooltip: 'Add Prize',
            backgroundColor: Color.fromARGB(255, 5, 89, 91),
            child: Icon(Icons.add),
          ))
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: GestureDetector(
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
        actions: <Widget>[
          GestureDetector(
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
