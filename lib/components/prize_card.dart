// ignore_for_file: use_build_context_synchronously

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:trashsure/utils/useUserPrize.dart';

class PrizeCard extends StatelessWidget {
  const PrizeCard(
      {super.key,
      required this.pk,
      required this.usage,
      required this.nama,
      required this.poin,
      required this.stok, // Default value
      required this.desc,
      required this.request,
      required this.useUserPrize,
      required this.setState});

  final String usage; // Buat title di tombol pada card (Delete, Use, or Redeem)
  final CookieRequest request;
  final String pk;
  final String nama;
  final String poin; // Buat handle yang redeemed prize
  final String stok;
  final String desc;
  final UseUserPrize useUserPrize;
  final Function setState;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
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
                poin != "0"
                    ? Text(
                        "$poin Poin",
                      )
                    : const SizedBox(), // Empty widget
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
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            )),
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      desc,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 30,
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
                          // For redeeming the prize
                          if (usage == "Redeem") {
                            String response = await useUserPrize.redeemPrize(
                                context, pk, request);

                            if (response == "Berhasil Redeem") {
                              setState(() {});
                              Flushbar(
                                backgroundColor:
                                    const Color.fromARGB(255, 29, 167, 86),
                                flushbarPosition: FlushbarPosition.TOP,
                                title: "Berhasil",
                                duration: const Duration(seconds: 3),
                                message: "Berhasil mengambil prize!",
                              ).show(context);
                            } else {
                              if (response == "Poin Kurang" ||
                                  response == "Stok Habis") {
                                Flushbar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 244, 105, 77),
                                  flushbarPosition: FlushbarPosition.TOP,
                                  title: "Gagal",
                                  duration: const Duration(seconds: 3),
                                  message: response,
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
                            }

                            // For using the prize
                          } else if (usage == "Use") {
                            String response = await useUserPrize.usePrize(
                                context, pk, request);

                            if (response == "Prize berhasil digunakan") {
                              setState(() {});
                              Flushbar(
                                backgroundColor:
                                    const Color.fromARGB(255, 29, 167, 86),
                                flushbarPosition: FlushbarPosition.TOP,
                                title: "Berhasil",
                                duration: const Duration(seconds: 3),
                                message: "Berhasil menggunakan prize!",
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
                          }
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
