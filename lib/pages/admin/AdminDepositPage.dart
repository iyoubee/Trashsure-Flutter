// ignore_for_file: file_names
import 'package:trashsure/components/card_depost_admin.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/utils/useAdminDeposit.dart';

class AdminDepositPage extends StatefulWidget {
  const AdminDepositPage({super.key});

  @override
  State<AdminDepositPage> createState() => _AdminDepositPage();
}

class _AdminDepositPage extends State<AdminDepositPage> {
  UseAdminDeposit useAdminDeposit = UseAdminDeposit();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        body: FutureBuilder(
          future: useAdminDeposit.getAdminDeposit(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.data.isNotEmpty) {
                return Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "lib/assets/depo.jpg",
                        width: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Belum ada deposit yang bisa disetujui",
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
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => CardDepositAdmin(
                          jenisSampah: snapshot.data![index].fields.jenisSampah,
                          user: snapshot.data![index].fields.username,
                          beratSampah: snapshot.data![index].fields.beratSampah
                              .toString(),
                          pk: snapshot.data![index].pk.toString(),
                          request: request,
                          setState: setState,
                          useAdminDeposit: useAdminDeposit,
                          date: snapshot.data![index].fields.date,
                        ));
              }
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            Navigator.pushNamed(context, '/admin/deposit/add');
          },
          tooltip: 'Add Deposit',
          backgroundColor: const Color.fromARGB(255, 5, 89, 91),
          child: const Icon(Icons.add),
        ));
  }
}
