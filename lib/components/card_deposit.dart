// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CardDeposit extends StatelessWidget {
  const CardDeposit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 226, 215, 132),
                      ),
                      child: const Icon(
                        Icons.recycling,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Username",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 6, 44, 48),
                              fontSize: 19),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "... Kg",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 19),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonBar(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 244, 105, 77)),
                          onPressed: () {},
                          child: const Text("Tolak"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 29, 167, 86)),
                          onPressed: () {},
                          child: const Text("Terima"),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
