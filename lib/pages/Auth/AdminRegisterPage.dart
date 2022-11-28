// ignore_for_file: file_names

import 'package:another_flushbar/flushbar.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/components/button_back.dart';
import 'package:trashsure/components/button_register.dart';
import 'package:trashsure/components/field_email.dart';
import 'package:trashsure/components/field_password.dart';
import 'package:flutter/material.dart';

class AdminRegisterPage extends StatefulWidget {
  const AdminRegisterPage({super.key});

  @override
  State<AdminRegisterPage> createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  double _elementsOpacity = 1;
  bool loadingBallAppear = false;
  double loadingBallSize = 1;

  AlignmentGeometry _alignment = Alignment.center;
  bool stopScaleAnimtion = false;
  bool showMessages = false;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  String _email = "";
  String _password = "";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        bottom: false,
        child: loadingBallAppear
            ? Stack(
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 300),
                    alignment: _alignment,
                    child: TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 500),
                      tween: Tween(begin: 0, end: loadingBallSize),
                      onEnd: () {
                        if (!stopScaleAnimtion) {
                          setState(() {
                            if (loadingBallSize == 1) {
                              loadingBallSize = 1.5;
                            } else {
                              loadingBallSize = 1;
                            }
                          });
                        } else {}
                      },
                      builder: (_, value, __) => Transform.scale(
                        scale: value,
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: !stopScaleAnimtion
                                  ? Colors.black.withOpacity(0.8)
                                  : null,
                              shape: BoxShape.circle,
                            ),
                            child: null),
                      ),
                    ),
                  ),
                ],
              )
            : Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 70),
                            TweenAnimationBuilder<double>(
                              duration: const Duration(milliseconds: 300),
                              tween: Tween(begin: 1, end: _elementsOpacity),
                              builder: (_, value, __) => Opacity(
                                opacity: value,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      child: Image.asset("lib/assets/bin.png"),
                                    ),
                                    const SizedBox(height: 25),
                                    const Text(
                                      "Welcome,",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 35),
                                    ),
                                    Text(
                                      "Admin Register",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 35),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                children: [
                                  EmailField(
                                    fadeEmail: _elementsOpacity == 0,
                                    emailController: emailController,
                                    onSaved: (String? value) {
                                      setState(() {
                                        _email = value!;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 40),
                                  PasswordField(
                                    fadePassword: _elementsOpacity == 0,
                                    passwordController: passwordController,
                                    onSaved: (String? value) {
                                      setState(() {
                                        _password = value!;
                                      });
                                    },
                                  ),
                                  const SizedBox(height: 60),
                                  RegisterButton(
                                    elementsOpacity: _elementsOpacity,
                                    onTap: () async {
                                      setState(() {
                                        _elementsOpacity = 0;
                                      });
                                    },
                                    onAnimatinoEnd: () async {
                                      await Future.delayed(
                                          const Duration(milliseconds: 500));
                                      setState(() {
                                        loadingBallAppear = true;
                                      });
                                      _formKey.currentState?.save();
                                      final response = await request
                                          .post(
                                              "http://10.0.2.2:8000/admin/register/",
                                              {
                                                'username': _email,
                                                'password': _password,
                                              })
                                          .then((value) => {
                                                print(value),
                                                if (value['status'] == 200)
                                                  {
                                                    Navigator.pop(context),
                                                    Flushbar(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 29, 167, 86),
                                                      flushbarPosition:
                                                          FlushbarPosition.TOP,
                                                      title: "Berhasil",
                                                      duration: const Duration(
                                                          seconds: 3),
                                                      message:
                                                          "Berhasil register",
                                                    ).show(context)
                                                  }
                                                else
                                                  {
                                                    Navigator
                                                        .pushReplacementNamed(
                                                            context,
                                                            '/admin/register'),
                                                    Flushbar(
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              244,
                                                              105,
                                                              77),
                                                      flushbarPosition:
                                                          FlushbarPosition.TOP,
                                                      title: "Gagal",
                                                      duration: const Duration(
                                                          seconds: 3),
                                                      message: value['message'],
                                                    ).show(context)
                                                  }
                                              })
                                          .then((value) => {
                                                _alignment = Alignment.topRight,
                                                stopScaleAnimtion = true
                                              });
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  BackNavigateButton(
                                    elementsOpacity: _elementsOpacity,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
