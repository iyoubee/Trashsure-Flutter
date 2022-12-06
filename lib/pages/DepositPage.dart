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
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset("lib/assets/recycle-bin-deposit.png", height: 60, width: 60,),
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
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        leading: Image.asset("lib/assets/plastic.png", height: 40, width: 40,),
                        title: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Plastik", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              Text("Poin: 500", style: TextStyle(fontSize: 14, color: Colors.grey[600]),),
                              Text("Saldo: 1000", style: TextStyle(fontSize: 14, color: Colors.grey[600]),),
                            ],
                          ),
                        ),
                        trailing: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 3,),
                              Text("20 kg", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),),
                              SizedBox(height: 3,),
                              Text("27/11/2022", style: TextStyle(fontSize: 14, color: Colors.grey[600]),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        leading: Image.asset("lib/assets/electronic.png", height: 40, width: 40,),
                        title: Container(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Elektronik", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                              Text("Poin: 500", style: TextStyle(fontSize: 14, color: Colors.grey[600]),),
                              Text("Saldo: 1000", style: TextStyle(fontSize: 14, color: Colors.grey[600]),),
                            ],
                          ),
                        ),
                        trailing: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(height: 3,),
                              Text("20 kg", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red),),
                              SizedBox(height: 3,),
                              Text("27/11/2022", style: TextStyle(fontSize: 14, color: Colors.grey[600]),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}