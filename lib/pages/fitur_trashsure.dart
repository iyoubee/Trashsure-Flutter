import 'package:flutter/material.dart';

class FiturTrashsure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 175,
            color: Color.fromARGB(192, 150, 224, 125),
            child: Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Deposit\n",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  " Setorkan sampah elektronik atau plastik ke TrashSure. Setorkan sampah anda untuk mendapatkan point sesuai jumlah sampah yang disetorkan!",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ])))),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 175,
            color: Color.fromARGB(192, 150, 224, 125),
            child: Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Withdraw\n",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  " Tarik point yang anda dapat dengan withdraw untuk mendapatkan imbalan dan prize!",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ])))),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            height: 175,
            color: Color.fromARGB(192, 150, 224, 125),
            child: Center(
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text: "Reedem Point\n",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  " Tukarlah dan redeem point yang anda dapat untuk mendapatkan imbalan dan prize menarik!",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                        ])))),
      ),
    ]));
  }
}
