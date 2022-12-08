// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/components/prize_card.dart';
import 'package:trashsure/pages/user/YourPrizePage.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:trashsure/utils/useUserPrize.dart';

class RedeemPrizePage extends StatefulWidget {
  const RedeemPrizePage({super.key});

  @override
  State<RedeemPrizePage> createState() => _RedeemPrizePageState();
}

class _RedeemPrizePageState extends State<RedeemPrizePage> {
  UseUserPrize useUserPrize = UseUserPrize();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
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
                children: [
                  const Text(
                    "My Points",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  FutureBuilder(
                      future: useUserPrize.getPoints(request),
                      builder: (context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null) {
                          return const Text("Calculating...");
                        } else {
                          return Text(
                            snapshot.data.toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          );
                        }
                      }),
                  const SizedBox(
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
                          // Navigate to "Your Prize" page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const YourPrizePage()));
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
              FutureBuilder(
                future: useUserPrize.getPrize(request),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height / 4),
                      child: const Center(child: CircularProgressIndicator()),
                    );

                    // Kalau tidak ada prize yang didaftarkan oleh admin
                  } else if (snapshot.data.isEmpty) {
                    // Show info that there are no prizes
                    return Container(
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
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );

                    // Kalau ada hadiah yang didaftarkan oleh admin
                  } else {
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          return PrizeCard(
                              pk: snapshot.data![index].pk.toString(),
                              usage: "Redeem",
                              nama: snapshot.data![index].fields.nama,
                              poin:
                                  snapshot.data![index].fields.poin.toString(),
                              stok:
                                  snapshot.data![index].fields.stok.toString(),
                              desc: snapshot.data![index].fields.desc,
                              request: request,
                              useUserPrize: useUserPrize,
                              setState: setState);
                        });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
