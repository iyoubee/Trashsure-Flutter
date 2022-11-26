// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trashsure/components/animations.dart';
import 'package:trashsure/pages/signup_screen.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final feature = ["Login", "Sign Up"];

  int i = 0;

  String _email = "";
  String _password = "";

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            backgroundColor: Color(0xfffdfdfdf),
            body: i == 0
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(25),
                          child: Column(
                            children: [
                              Row(
                                  // TabBar Code
                                  children: [
                                    SizedBox(
                                      height: height / 19,
                                      width: width / 2,
                                      child: TopAnime(
                                        2,
                                        5,
                                        child: ListView.builder(
                                          itemCount: feature.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  i = index;
                                                });
                                              },
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: Text(
                                                      feature[index],
                                                      style: TextStyle(
                                                        color: i == index
                                                            ? Colors.black
                                                            : Colors.grey,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  i == index
                                                      ? Container(
                                                          height: 3,
                                                          width: width / 9,
                                                          color: Colors.black,
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),

                                    // Profile
                                  ]),

                              SizedBox(
                                height: 50,
                              ),

                              // Top Text
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                width: width,
                                child: TopAnime(
                                  1,
                                  20,
                                  curve: Curves.fastOutSlowIn,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Welcome Back",
                                          style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.w300,
                                          )),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: height / 14,
                              ),

                              // TextFiled
                              Column(
                                children: [
                                  SizedBox(
                                    width: width / 1.2,
                                    height: height / 3.10,
                                    //  color: Colors.red,
                                    child: TopAnime(1, 15,
                                        curve: Curves.easeInExpo,
                                        child: Form(
                                          key: _formKey,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextFormField(
                                                // readOnly: true, // * Just for Debug
                                                cursorColor: Colors.black,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                showCursor: true,
                                                //cursorColor: mainColor,
                                                decoration:
                                                    kTextFiledInputDecoration,
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    _email = value!;
                                                  });
                                                },
                                                onSaved: (String? value) {
                                                  setState(() {
                                                    _email = value!;
                                                  });
                                                },
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Email tidak boleh kosong!';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              TextFormField(
                                                // readOnly: true, // * Just for Debug
                                                cursorColor: Colors.black,
                                                style: TextStyle(
                                                    color: Colors.black),
                                                showCursor: true,
                                                //cursorColor: mainColor,
                                                decoration:
                                                    kTextFiledInputDecoration
                                                        .copyWith(
                                                            labelText:
                                                                "Password"),
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    _password = value!;
                                                  });
                                                },
                                                onSaved: (String? value) {
                                                  setState(() {
                                                    _password = value!;
                                                  });
                                                },
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Password tidak boleh kosong!';
                                                  }
                                                  return null;
                                                },
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        // Bottom
                        i == 0
                            ? TopAnime(
                                2,
                                42,
                                curve: Curves.fastOutSlowIn,
                                child: SizedBox(
                                  height: height / 6,
                                  // color: Colors.red,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 30,
                                        top: 15,
                                        child: Text(
                                          "Fogot Password?",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 43),
                                        child: Container(
                                          height: height / 9,
                                        ),
                                      ),
                                      Positioned(
                                        left: 280,
                                        top: 10,
                                        child: GestureDetector(
                                          onTap: () async {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              final response = await request.login(
                                                  "http://10.0.2.2:8000/login/",
                                                  {
                                                    'username': _email,
                                                    'password': _password,
                                                  });
                                            }
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Color(0xffF2C94C),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            width: width / 4,
                                            height: height / 12,
                                            child: Icon(
                                              Icons.arrow_forward,
                                              size: 35,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SignUPScreen()
                      ],
                    ),
                  )
                : SignUPScreen()),
      ),
    );
  }
}
