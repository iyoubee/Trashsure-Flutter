// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trashsure/components/card_withdraw.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:trashsure/utils/useUserWithdraw.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  int index = 0;

  UseUserWithdraw useUserWithdraw = UseUserWithdraw();
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
              const Text(
                "Withdraw",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
              ),
              const SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: useUserWithdraw.getBalance(request),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        height: 110,
                        decoration: BoxDecoration(
                          color: Colors.amber[600],
                          // color: Colors.deepPurple[300],
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child:
                            const Center(child: CircularProgressIndicator()));
                  } else {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.amber[600],
                        // color: Colors.deepPurple[300],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          const SizedBox(height: 10),
                          const Text('Balance',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 23)),
                          const SizedBox(height: 10),
                          Text(
                            "Rp ${snapshot.data![index].fields.balance}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
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
                  const Text(
                    "View All",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: useUserWithdraw.getWithdraw(request),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.data.isNotEmpty) {
                      return Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).size.height / 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.credit_card_off_outlined,
                              size: 50,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Belum ada penarikan",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => CardWithdraw(
                              date: snapshot.data![index].fields.date,
                              jumlah: snapshot.data![index].fields.jumlah));
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.pushNamed(context, '/user/withdraw/add');
        },
        tooltip: 'Add Withdraw',
        backgroundColor: const Color.fromARGB(255, 5, 89, 91),
        child: const Icon(Icons.add),
      ),
    );
  }
}
