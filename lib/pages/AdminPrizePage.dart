// ignore_for_file: file_names
import 'package:trashsure/components/card_prize.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:trashsure/utils/useAdminPrize.dart';

class AdminPrizePage extends StatefulWidget {
  const AdminPrizePage({super.key});

  @override
  State<AdminPrizePage> createState() => _AdminPrizePage();
}

class _AdminPrizePage extends State<AdminPrizePage> {
  UseAdminPrize useAdminPrize = UseAdminPrize();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 245, 245),
        body: FutureBuilder(
          future: useAdminPrize.getAdminPrize(request),
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
                        "lib/assets/prize.jpg",
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
                    itemBuilder: (_, index) => AdminPrizeCard(
                          useAdminPrize: useAdminPrize,
                          request: request,
                          pk: snapshot.data![index].pk.toString(),
                          usage: "delete",
                          nama: snapshot.data![index].fields.nama,
                          poin: snapshot.data![index].fields.poin.toString(),
                          stok: snapshot.data![index].fields.stok.toString(),
                          desc: snapshot.data![index].fields.desc,
                          setState: setState,
                        ));
              }
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            Navigator.pushNamed(context, '/admin/prize/add');
          },
          tooltip: 'Add Prize',
          backgroundColor: const Color.fromARGB(255, 5, 89, 91),
          child: const Icon(Icons.add),
        ));
  }
}
