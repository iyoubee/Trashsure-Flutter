import 'package:flutter/material.dart';
import 'package:trashsure/components/button_add_deposit.dart';
import 'package:trashsure/components/card_deposit_user.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
          child: Column(
            children: [
              const Text(
                "Deposit",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
              ),
              const SizedBox(
                height: 20,
              ),
              const AddDepositButton(),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "History",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CardDepositUser(jenis: 'Elektronik'),
              const CardDepositUser(jenis: 'Plastik')
            ],
          ),
        ),
      ),
    );
  }
}
