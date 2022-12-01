import 'package:flutter/material.dart';

class AboutTrashsure extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Container(
          width: double.infinity,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/Garbage.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.dstATop),
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        text:
                            "Build Better Environment And Economy With TrashSure!\n",
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                              text:
                                  "Ubah sampah di rumahmu menjadi imbalan yang menarik!\n",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18))
                        ])),
                Container(
                    height: 30,
                    width: 100,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: ()
                       {Navigator.pushNamed(context, '/login');},
                    ))
              ]
              )));
}
