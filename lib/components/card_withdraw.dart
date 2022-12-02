// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardWithdraw extends StatelessWidget {
  const CardWithdraw({
    super.key,
    required this.date,
    required this.jumlah,
  });

  final DateTime date;
  final String jumlah;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      alignment: Alignment.topLeft,
      child: Card(
        child: ListTile(
          leading: Image.asset(
            "lib/assets/withdraw.png",
            height: 30,
            width: 30,
          ),
          // leading: CircleAvatar(
          // ),
          title: Text(DateFormat.yMMMd().format(date)),
          trailing: Text(
            "Rp $jumlah",
            style: const TextStyle(color: Colors.green),
          ),
        ),
      ),
    );
  }
}
