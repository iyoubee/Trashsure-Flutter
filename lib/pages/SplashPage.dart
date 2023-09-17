// ignore_for_file: file_names, use_build_context_synchronously

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
    if (request.loggedIn) {
      await Future.delayed(const Duration(
          seconds: 3)); // Add a 3-second delay// Add a small delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserPage(idx: 0)),
      );
    } else {
      await Future.delayed(const Duration(
          seconds: 3)); // Add a 3-second delay // Add a small delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LandingPage()),
      );
    }
  }

  bool loadingBallAppear = false;
  double loadingBallSize = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment: Alignment.center,
                  child: TweenAnimationBuilder<double>(
                    duration: const Duration(milliseconds: 500),
                    tween: Tween(begin: 0, end: loadingBallSize),
                    onEnd: () {
                      setState(() {
                        if (loadingBallSize == 1) {
                          loadingBallSize = 1.5;
                        } else {
                          loadingBallSize = 1;
                        }
                      });
                    },
                    builder: (_, value, __) => Transform.scale(
                      scale: value,
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.8),
                            shape: BoxShape.circle,
                          ),
                          child: null),
                    ),
                  ),
                ),
              ],
            )));
  }
}
