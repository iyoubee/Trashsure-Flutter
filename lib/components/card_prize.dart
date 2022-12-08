// ignore_for_file: use_build_context_synchronously

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:trashsure/utils/useAdminPrize.dart';

class AdminPrizeCard extends StatelessWidget {
  const AdminPrizeCard(
      {super.key,
      required this.pk,
      required this.usage,
      required this.nama,
      required this.poin,
      required this.stok,
      required this.desc,
      required this.request,
      required this.useAdminPrize,
      required this.setState});

  final CookieRequest request;
  final String pk;
  final String nama;
  final String poin;
  final String stok;
  final String desc;
  final String usage;

  final UseAdminPrize useAdminPrize;
  final Function setState;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ], color: Colors.white70, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Image.asset(
              "lib/assets/voucher.jpg",
              width: double.infinity,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "$poin Poin",
                ),
                const SizedBox(
                  height: 3,
                ),
                Text("Stok: $stok"),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                )),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      desc,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              Colors.lightGreen,
                                            ),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Close the bottom sheet
                                          },
                                          child: const Text(
                                            "Close",
                                            style: TextStyle(
                                              fontSize: 18,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Details"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 35,
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                    side: const BorderSide(
                                        color: Colors.green)))),
                        onPressed: () async {
                          int response = await useAdminPrize.delPrize(
                              context, pk, request);
                          if (response == 200) {
                            setState(() {});
                            Flushbar(
                              backgroundColor:
                                  const Color.fromARGB(255, 29, 167, 86),
                              flushbarPosition: FlushbarPosition.TOP,
                              title: "Berhasil",
                              duration: const Duration(seconds: 3),
                              message: "Prize berhasil dihapus",
                            ).show(context);
                          } else {
                            Flushbar(
                              backgroundColor:
                                  const Color.fromARGB(255, 244, 105, 77),
                              flushbarPosition: FlushbarPosition.TOP,
                              title: "Gagal",
                              duration: const Duration(seconds: 3),
                              message: "Ada yang salah",
                            ).show(context);
                          }
                          // Unfocus the last selected input field
                        },
                        child: Text(
                          usage,
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
