// ignore_for_file: file_names, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardDepositUser extends StatelessWidget {
  const CardDepositUser({
    super.key,
    required this.poin,
    required this.totalHarga,
    required this.jenisSampah,
    required this.beratSampah,
    required this.date,
    required this.isApprove,
  });

  final String poin;
  final String totalHarga;
  final String jenisSampah;
  final String beratSampah;
  final DateTime date;
  final String isApprove;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    jenisSampah,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "Poin: $poin",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    "Saldo: $totalHarga",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  Text(
                    isApprove,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isApprove == 'DITERIMA'
                            ? Colors.green
                            : isApprove == 'DITOLAK'
                                ? Colors.red
                                : Colors.yellow),
                  ),
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
