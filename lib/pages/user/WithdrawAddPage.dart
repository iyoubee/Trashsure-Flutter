// ignore_for_file: file_names, use_build_context_synchronously, unused_local_variable

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/pages/user/UserPage.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/utils/useUserWithdraw.dart';

class WithdrawAddPage extends StatefulWidget {
  const WithdrawAddPage({super.key});

  @override
  State<WithdrawAddPage> createState() => _WithdrawAddPageState();
}

class _WithdrawAddPageState extends State<WithdrawAddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  UseUserWithdraw useUserWithdraw = UseUserWithdraw();

  String _jumlah = "";

  void _submit(context, request) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user can tap anywhere to close the pop up
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Jumlah:",
                        style: TextStyle(fontWeight: FontWeight.w700))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(_jumlah),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.grey,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: const Text('Batal'),
                  onPressed: () {
                    Navigator.pop(context);
                  }, // so the alert dialog is closed when navigating back to main page
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: const Text('Konfirmasi'),
                  onPressed: () async {
                    final response = await useUserWithdraw
                        .addWithdraw(context, request, _jumlah)
                        .then((value) => {
                              if (value['status'] == 200)
                                {
                                  Navigator.pop(context),
                                  Navigator.pop(context),
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const UserPage(idx: 3))),
                                  Flushbar(
                                    backgroundColor:
                                        const Color.fromARGB(255, 29, 167, 86),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    title: "Berhasil",
                                    duration: const Duration(seconds: 3),
                                    message: value['message'],
                                  ).show(context)
                                }
                              else
                                {
                                  Navigator.pop(context),
                                  Navigator.pop(context),
                                  Flushbar(
                                    backgroundColor:
                                        const Color.fromARGB(255, 244, 105, 77),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    title: "Gagal",
                                    duration: const Duration(seconds: 3),
                                    message: value['message'],
                                  ).show(context)
                                }
                            });
                    FocusScope.of(context)
                        .unfocus(); // Unfocus the last selected input field
                    _formKey.currentState?.reset();
                    setState(() {});
                  },
                )
              ],
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text("Penarikan saldo",
                      style: TextStyle(
                        fontSize: 24,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Jumlah',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.contains(RegExp(r'^[a-zA-Z\-]'))) {
                            return 'Use only numbers!';
                          } else if (int.parse(value) <= 0) {
                            return 'Harus lebih dari 0';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            _jumlah = value;
                            // bodyTempList.add(bodyTemp);
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            _jumlah = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 5, 89, 91),
                            minimumSize: const Size.fromHeight(60)),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            _submit(context, request);
                          }
                        },
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
