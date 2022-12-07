// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AddDepositButton extends StatefulWidget {
  const AddDepositButton({super.key});

  @override
  State<AddDepositButton> createState() => _AddDepositButtonState();
}

class _AddDepositButtonState extends State<AddDepositButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 120,
      minWidth: double.infinity,
      color: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onPressed: () {
        Navigator.pushNamed(context, '/user/deposit/add');
      },
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              "lib/assets/recycle-bin-deposit.png",
              height: 60,
              width: 60,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Expanded(
            child: Text(
              'Tukarkan sampah Anda sekarang!',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
