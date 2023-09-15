// ignore_for_file: file_names, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trashsure/pages/LandingPage.dart';
import 'package:trashsure/pages/user/UserPage.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkLoggedInAndNavigate();
  }

  void _checkLoggedInAndNavigate() async {
    final request = context.read<CookieRequest>();
    await request.init();
    log("init ${request.cookies}");
    if (request.loggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserPage(idx: 0)),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(), // Display a loading indicator
    );
  }
}
