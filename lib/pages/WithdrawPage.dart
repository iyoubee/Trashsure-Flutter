import 'package:flutter/material.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
          child: Column(
            children: [
              Text("Withdraw", style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 21),),
              Text(("                                 ")),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.amber[600],
                  // color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text('Balance', style: TextStyle(color: Colors.white)),
                    SizedBox(height: 10),
                    Text("Rp 100000", style: TextStyle(color: Colors.white, fontSize: 23),),
                  ],
                ),
              ),
              Text(("                                 ")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("History", style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("View All", style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold),),
                ],
              ),
              Text(("                                 "), style: TextStyle(fontSize: 10),),
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Card(
                    child: ListTile(
                      leading: Image.asset("lib/assets/withdraw.png", height: 30, width: 30,),
                      // leading: CircleAvatar(
                      // ),
                      title: Text("28/11/2002"),
                      trailing: Text("Rp 50000", style: TextStyle(color: Colors.green),),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Card(
                    child: ListTile(
                      leading: Image.asset("lib/assets/withdraw.png", height: 30, width: 30,),
                      // leading: CircleAvatar(
                      // ),
                      title: Text("27/11/2002"),
                      trailing: Text("Rp 25000", style: TextStyle(color: Colors.green),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Add Withdraw',
        backgroundColor: Color.fromARGB(255, 5, 89, 91),
        child: Icon(Icons.add),
      ),
    );
  }
}
