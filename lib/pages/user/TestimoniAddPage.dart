// ignore_for_file: file_names, use_build_context_synchronously, unused_local_variable

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/utils/useTestimoni.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';

class TestimoniAddPage extends StatefulWidget {
  const TestimoniAddPage({super.key});

  @override
  State<TestimoniAddPage> createState() => _TestimoniAddPageState();
}

class _TestimoniAddPageState extends State<TestimoniAddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  UseTestimoni useTestimoni = UseTestimoni();

  String poin = "";
  String judul = "";
  String stok = "";
  String desc = "";

  void _submit(context, request) {
    showDialog<void>(
      context: context,
      barrierDismissible: true, // user can tap anywhere to close the pop up
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: SingleChildScrollView(
            child: Column(
              children: const <Widget>[
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Anda yakin?",
                        style: TextStyle(fontWeight: FontWeight.w700))),
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
                    final response = await useTestimoni
                        .addTestimoni(context, request, desc)
                        .then((value) => {
                              Navigator.pop(context),
                              if (value['status'] == 200)
                                {
                                  Navigator.pop(context),
                                  Flushbar(
                                    backgroundColor:
                                        const Color.fromARGB(255, 29, 167, 86),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    title: "Berhasil",
                                    duration: const Duration(seconds: 3),
                                    message: value['message'],
                                  ).show(context),
                                }
                              else
                                {
                                  Navigator.pop(context),
                                  Flushbar(
                                    backgroundColor:
                                        const Color.fromARGB(255, 244, 105, 77),
                                    flushbarPosition: FlushbarPosition.TOP,
                                    title: "Gagal",
                                    duration: const Duration(seconds: 3),
                                    message: value['message'],
                                  ).show(context),
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
                  child: Text("Masukan Testimoni",
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
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                            labelText: 'Testimoni',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            border: OutlineInputBorder()),
                        onFieldSubmitted: (value) {
                          setState(() {
                            desc = value;
                            // firstNameList.add(firstName);
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            desc = value;
                          });
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return 'Testimoni must contain at least 3 characters';
                          }
                          return null;
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
