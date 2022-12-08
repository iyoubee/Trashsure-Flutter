// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/components/prize_card.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:trashsure/utils/useUserPrize.dart';

class YourPrizePage extends StatefulWidget {
  const YourPrizePage({super.key});

  @override
  State<YourPrizePage> createState() => _YourPrizePageState();
}

class _YourPrizePageState extends State<YourPrizePage> {
  UseUserPrize useUserPrize = UseUserPrize();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 245, 245, 245),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 245, 245, 245),
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            leading: GestureDetector(
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            title: SizedBox(
                // App Logo in the middle of AppBar
                width: 35,
                child: Image.asset("lib/assets/bin.png")),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
              child: FutureBuilder(
                future: useUserPrize.getRedeemedPrize(request),
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
                          vertical: MediaQuery.of(context).size.height / 3),
                      child: Center(
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
                              "Kamu belum memiliki hadiah",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
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
                              usage: "Use",
                              nama: snapshot.data![index].fields.nama,
                              poin: "0",
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
            ),
          )),
    );
  }
}
