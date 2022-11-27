// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CardPrize extends StatelessWidget {
  const CardPrize({super.key});

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
        padding: const EdgeInsets.all(20),
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(height: 20),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Iphone 13 Pro Max",
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 6, 44, 48),
                                fontSize: 32),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Poin: ...",
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 19),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Stok: ...",
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 19),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Deskripsi:",
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 19),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            textAlign: TextAlign.justify,
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 19),
                          ),
                        ],
                      ),
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
                          child: const Text("Hapus"),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )));
  }
}
