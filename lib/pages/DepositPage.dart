import 'package:flutter/material.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, top: 24, right: 24),
          child: Column(
            children: [
              Text("Deposit", style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 21),),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                height: 120,
                minWidth: double.infinity,
                color: Color(0xFFFFFFFF),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(12)),
                onPressed: () {},
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset("lib/assets/recycle-bin-deposit.png", height: 90, width: 90,),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Expanded(
                        child: Text('Tukarkan sampah Anda sekarang!',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                      ),
                    ),
                    // SizedBox(
                    //   width: double.infinity,
                    // ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("History", style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),),
                  Text("View All", style: TextStyle(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.bold),),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Card(
                    child: ListTile(
                      leading: Image.asset("lib/assets/plastic.png", height: 30, width: 30,),
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