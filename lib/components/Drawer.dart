// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          ),
          ListTile(
            title: const Text('Login'),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
          ListTile(
            title: const Text('Admin'),
            onTap: () {
              Navigator.pushNamed(context, '/admin');
            },
          ),
          ListTile(
            title: const Text('User'),
            onTap: () {
              Navigator.pushNamed(context, '/user');
            },
          ),
        ],
      ),
    );
  }
}
