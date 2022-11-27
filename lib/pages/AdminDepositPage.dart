// ignore_for_file: file_names
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/components/card_deposit.dart';
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
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
        body: FutureBuilder(
          future: useAdminDeposit.getAdminDeposit(request),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    SizedBox(height: 8),
                    Text(
                      "Tidak ada to do list :(",
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) => CardDeposit(
                          jenis: snapshot.data![index].fields.jenisSampah,
                          user: snapshot.data![index].fields.username,
                          berat: snapshot.data![index].fields.beratSampah
                              .toString(),
                          pk: snapshot.data![index].pk.toString(),
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
          backgroundColor: Color.fromARGB(255, 5, 89, 91),
          child: Icon(Icons.add),
        ));
  }
}
