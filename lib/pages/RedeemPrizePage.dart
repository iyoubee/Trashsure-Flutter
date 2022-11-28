import 'package:flutter/material.dart';
import 'package:trashsure/components/prize_card.dart';

class RedeemPrizePage extends StatefulWidget {
  const RedeemPrizePage({super.key});

  @override
  State<RedeemPrizePage> createState() => _RedeemPrizePageState();
}

class _RedeemPrizePageState extends State<RedeemPrizePage> {
  // Dummy Data
  List listOfPrize = ["Redeem", "Use", "Delete"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
          child: Column(
            children: [
              Column(
                // Show user points
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "My Points",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "1000",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
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
                                    side: const BorderSide(
                                        color: Colors.green)))),
                        onPressed: () {
                          // Navigate ke page yang berisi prize yang udah di-redeem
                        },
                        child: const Text(
                          "Your Prize",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              listOfPrize.isNotEmpty
                  ?
                  // Show list of prize
                  Builder(builder: (context) {
                      return Column(
                        children: listOfPrize
                            .map(
                              (item) => PrizeCard(usage: item),
                            )
                            .toList(),
                      );
                    })
                  :
                  // Show info that there are no prizes
                  Container(
                      margin: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/assets/prize.jpg",
                            width: 50,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Belum ada hadiah yang bisa diambil",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
