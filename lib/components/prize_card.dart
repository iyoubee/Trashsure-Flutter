import 'package:flutter/material.dart';

class PrizeCard extends StatelessWidget {
  const PrizeCard({super.key, required this.usage});

  final String usage; // Buat title di tombol pada card (Delete, Use, or Redeem)

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: 260,
      decoration: BoxDecoration(
          color: Colors.white70, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Image.asset(
              "lib/assets/voucher.jpg",
              width: double.infinity,
              height: 130,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Voucher Belanja 300k",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text(
                  "25 Poin",
                ),
                const SizedBox(
                  height: 3,
                ),
                const Text("Stok: 2"),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                )),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                        "Voucher ini bisa digunakan untuk belanja di Alfamart, Indomaret, dan Alfamidi.",
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all(
                                            Colors.lightGreen,
                                          ),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18)
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context); // Close the bottom sheet
                                        },
                                        child: const Text(
                                          "Close",
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),)
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.arrow_drop_down,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Details"),
                        ],
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
                        child: Text(
                          usage,
                          style: const TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
