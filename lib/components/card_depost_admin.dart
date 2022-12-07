// ignore_for_file: file_names, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trashsure/utils/useAdminDeposit.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:trashsure/utils/auth.dart';

class CardDepositAdmin extends StatelessWidget {
  const CardDepositAdmin(
      {super.key,
      required this.jenisSampah,
      required this.beratSampah,
      required this.date,
      required this.user,
      required this.pk,
      required this.request,
      required this.useAdminDeposit,
      required this.setState});

  final String jenisSampah;
  final String beratSampah;
  final DateTime date;
  final String user;
  final String pk;
  final UseAdminDeposit useAdminDeposit;
  final Function setState;
  final CookieRequest request;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.topLeft,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: ListTile(
            leading: Image.asset(
              jenisSampah == 'Plastik'
                  ? "lib/assets/plastic.png"
                  : "lib/assets/electronic.png",
              height: 40,
              width: 40,
            ),
            title: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    jenisSampah,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Row(
                    children: [
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
                      const SizedBox(
                        width: 3,
                      ),
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
                    ],
                  )
                ],
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "$beratSampah kg",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  DateFormat.yMMMd().format(date),
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
                const SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
