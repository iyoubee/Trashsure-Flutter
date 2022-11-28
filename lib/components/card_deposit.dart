// ignore_for_file: file_names, prefer_const_constructors, use_build_context_synchronously

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:trashsure/utils/useAdminDeposit.dart';

class CardDeposit extends StatelessWidget {
  final String jenis;
  final String user;
  final String berat;
  final String pk;

  const CardDeposit(
      {super.key,
      required this.jenis,
      required this.user,
      required this.berat,
      required this.pk,
      required this.request,
      required this.useAdminDeposit,
      required this.setState});

  final UseAdminDeposit useAdminDeposit;
  final Function setState;
  final CookieRequest request;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            user,
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Color.fromARGB(255, 6, 44, 48),
                                fontSize: 19),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            jenis,
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 19),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "$berat Kg",
                            softWrap: true,
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.5),
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
                          onPressed: () async {
                            int response = await useAdminDeposit.delDeposit(
                                context, pk, request);
                            if (response == 200) {
                              setState(() {});
                              Flushbar(
                                backgroundColor:
                                    const Color.fromARGB(255, 29, 167, 86),
                                flushbarPosition: FlushbarPosition.TOP,
                                title: "Berhasil",
                                duration: const Duration(seconds: 3),
                                message: "Deposit berhasil ditolak",
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
                          child: const Text("Tolak"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 29, 167, 86)),
                          onPressed: () async {
                            int response = await useAdminDeposit.accDeposit(
                                context, pk, request);
                            if (response == 200) {
                              setState(() {});
                              Flushbar(
                                backgroundColor:
                                    const Color.fromARGB(255, 29, 167, 86),
                                flushbarPosition: FlushbarPosition.TOP,
                                title: "Berhasil",
                                duration: const Duration(seconds: 3),
                                message: "Deposit berhasil disetujui",
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
