// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RegisterNavigateButton extends StatefulWidget {
  final Function onTap;
  final double elementsOpacity;
  const RegisterNavigateButton(
      {super.key, required this.onTap, required this.elementsOpacity});

  @override
  State<RegisterNavigateButton> createState() => _RegisterNavigateButtonState();
}

class _RegisterNavigateButtonState extends State<RegisterNavigateButton> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween(begin: 1, end: widget.elementsOpacity),
      builder: (_, value, __) => GestureDetector(
        onTap: () {
          widget.onTap();
        },
        child: Opacity(
          opacity: value,
          child: Container(
            width: 230,
            height: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 224, 227, 231),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 19),
                ),
                const SizedBox(width: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
