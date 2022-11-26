// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trashsure/components/Drawer.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
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
    Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          tooltip: 'Add Deposit',
          backgroundColor: Color.fromARGB(255, 5, 89, 91),
          child: Icon(Icons.add),
        ))
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
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
      drawer: DrawerCustom(),
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
        selectedItemColor: const Color.fromARGB(255, 226, 215, 132),
        onTap: _onItemTapped,
      ),
    );
  }
}
