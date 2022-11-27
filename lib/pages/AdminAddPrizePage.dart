// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AdminAddPrizePage extends StatefulWidget {
  const AdminAddPrizePage({super.key});

  @override
  State<AdminAddPrizePage> createState() => _AdminAddPrizePageState();
}

class _AdminAddPrizePageState extends State<AdminAddPrizePage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  String poin = "";
  String judul = "";
  String stok = "";
  String desc = "";

  void _submit() {
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
                    child: Text("Judul / Nama:",
                        style: TextStyle(fontWeight: FontWeight.w700))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(judul),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Poin:",
                        style: TextStyle(fontWeight: FontWeight.w700))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(poin),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Stok:",
                        style: TextStyle(fontWeight: FontWeight.w700))),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(stok),
                )
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
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
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  child: const Text('OK'),
                  onPressed: () {
                    FocusScope.of(context)
                        .unfocus(); // Unfocus the last selected input field
                    _formKey.currentState?.reset();
                    setState(() {});
                    Navigator.pop(context); // Empty the form fields
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
                  child: Text("Masukan Data Prize",
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
                            labelText: 'Nama / Judul',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1.0),
                            ),
                            border: OutlineInputBorder()),
                        onFieldSubmitted: (value) {
                          setState(() {
                            judul = value;
                            // firstNameList.add(firstName);
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            judul = value;
                          });
                        },
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 3) {
                            return 'First Name must contain at least 3 characters';
                          } else if (value
                              .contains(RegExp(r'^[0-9_\-=@,\.;]+$'))) {
                            return 'First Name cannot contain special characters';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Poin',
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
                          }
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            poin = value;
                            // bodyTempList.add(bodyTemp);
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            poin = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: 'Stok',
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
                          }
                        },
                        onFieldSubmitted: (value) {
                          setState(() {
                            stok = value;
                            // bodyTempList.add(bodyTemp);
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            stok = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: const InputDecoration(
                            labelText: 'Deskripsi',
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
                            return 'Deskripsi must contain at least 3 characters';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(60)),
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            _submit();
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
