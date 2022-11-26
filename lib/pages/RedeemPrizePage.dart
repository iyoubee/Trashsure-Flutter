import 'package:flutter/material.dart';
import 'package:trashsure/components/card_prize.dart';

class RedeemPrizePage extends StatefulWidget {
  const RedeemPrizePage ({super.key});

  @override
  State<RedeemPrizePage> createState() => _RedeemPrizePageState();
}

class _RedeemPrizePageState extends State<RedeemPrizePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Prize List",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w700,
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
                              side: const BorderSide(color: Colors.blue)
                            )
                          )
                        ),
                        onPressed: () {
                          // Navigate ke page yang berisi prize yang udah di-redeem
                        },
                        child: const Text("Your Prize"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              CardPrize(), // Belom pakai card khusus redeem
              const SizedBox(height: 20,),
              CardPrize(),
              const SizedBox(height: 20,),
              CardPrize(),
              const SizedBox(height: 20,),
              CardPrize(),
              const SizedBox(height: 20,),
              CardPrize(),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
