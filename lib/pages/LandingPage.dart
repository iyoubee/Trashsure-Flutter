// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:trashsure/pages/auth/LoginPage.dart';
import 'package:trashsure/pages/auth/RegisterPage.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:trashsure/utils/useTestimoni.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController controller = ScrollController();

  UseTestimoni useTestimoni = UseTestimoni();

  void scrollDown() {
    // Method buat automatically scroll down saat tombol dipencet
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.35,
                        child: Image.asset(
                          'lib/assets/landingbg4.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 20, right: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                "lib/assets/bin.png",
                                width: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "TrashSure",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3.5,
                          ),
                          Column(
                            children: [
                              const Text(
                                "Bank Sampah Digital",
                                style: TextStyle(
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "TrashSure hadir sebagai solusi digital untuk mengorganisir sampah secara efektif dengan imbalan yang menarik!",
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 150,
                                    child: TextButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(18),
                                                side: const BorderSide(
                                                    color: Colors.green))),
                                      ),
                                      onPressed: () {
                                        scrollDown();
                                      },
                                      child: const Text(
                                        "Lihat Testimoni",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 500,
                color: const Color.fromARGB(255, 245, 245, 245),
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Center(
                          child: Text(
                            "Kenapa TrashSure?",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PageViewCustom(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: const Color.fromARGB(255, 245, 245, 245),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Fitur",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: const Color(0xffaed6dc),
                      child: ExpansionTile(
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.all(18),
                        title: Row(
                          children: const [
                            Icon(
                              Icons.send_and_archive_outlined,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Deposit")
                          ],
                        ),
                        children: const [
                          Text(
                              "Setorkan sampah elektronik atau plastik ke TrashSure. Setorkan sampah anda untuk mendapatkan point sesuai jumlah sampah yang disetorkan!")
                        ],
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: const Color(0xffff9a8d),
                      child: ExpansionTile(
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.all(18),
                        title: Row(
                          children: const [
                            Icon(
                              Icons.credit_card,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Withdraw")
                          ],
                        ),
                        children: const [
                          Text(
                              "Tarik point yang anda dapat dengan withdraw untuk mendapatkan imbalan dan prize!")
                        ],
                      ),
                    ),
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      color: const Color(0xff4a536b),
                      child: ExpansionTile(
                        expandedCrossAxisAlignment: CrossAxisAlignment.start,
                        childrenPadding: const EdgeInsets.all(18),
                        title: Row(
                          children: const [
                            Icon(
                              Icons.wallet_giftcard,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Redeem Point")
                          ],
                        ),
                        children: const [
                          Text(
                              "Tukarlah dan redeem point yang anda dapat untuk mendapatkan imbalan dan prize menarik!")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                color: const Color.fromARGB(255, 245, 245, 245),
                child: Column(children: <Widget>[
                  const Text(
                    "Testimoni",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  if (request.loggedIn)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 150,
                          child: TextButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                      side: const BorderSide(
                                          color: Colors.green))),
                            ),
                            onPressed: () {
                              // scrollDown();
                              Navigator.pushNamed(
                                  context, '/user/testimoni/add');
                            },
                            child: const Text(
                              "Tambah Testimoni",
                            ),
                          ),
                        ),
                      ],
                    ),
                  Column(
                    children: [
                      FutureBuilder(
                          future: useTestimoni.fetchTestimoni(),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (!snapshot.data.isNotEmpty) {
                                return Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          MediaQuery.of(context).size.height /
                                              10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.message_outlined,
                                        size: 50,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Belum ada testimoni",
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
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (_, index) => Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 12),
                                          padding: const EdgeInsets.all(20.0),
                                          decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                  255, 226, 215, 132),
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              boxShadow: const [
                                                BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 2.0)
                                              ]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Column(
                                                children: [
                                                  RichText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text: TextSpan(
                                                          text:
                                                              "${snapshot.data![index].fields.desc}\n",
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      18))),
                                                  Text(
                                                    "${snapshot.data![index].fields.username}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 4),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ));
                              }
                            }
                          }),
                      if (!request.loggedIn)
                        const SizedBox(
                          height: 60,
                        )
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
        floatingActionButton: !request.loggedIn
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    // border: Border.all(color: Colors.black),
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 29, 167, 86),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RegisterPage()));
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text("Sign In",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            : null,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

// Class untuk Page View
class PageViewCustom extends StatefulWidget {
  const PageViewCustom({super.key});

  @override
  State<PageViewCustom> createState() => _PageViewCustomState();
}

class _PageViewCustomState extends State<PageViewCustom> {
  PageController? pageController;
  double? pageOffset = 0;
  double viewportFraction = 0.8;
  double? scale;
  List<List<dynamic>> listItem = [
    [
      Icons.waving_hand_outlined,
      "PRAKTIS",
      "Pengelolaan data dilakukan secara digital & dapat meningkatkan paperless activity."
    ],
    [
      Icons.search,
      "TRANSPARAN",
      "Pengelola Bank Sampah dapat mengelola tabungan nasabah secara transparan."
    ],
    [
      Icons.lock_outlined,
      "AMAN",
      "Pengelolaan data dilakukan secara aman dan rahasia untuk segala transaksi."
    ],
    [
      Icons.mobile_friendly_outlined,
      "MOBILE SUPPORT",
      "Transaksi dapat dilakukan dengan mudah dan nyaman melalui aplikasi mobile."
    ],
    [
      Icons.integration_instructions_outlined,
      "TERINTEGRASI",
      "Data Bank Sampah yang tergabung sudah terintegrasi sehingga memudahkan proses pemantauan pengelolaan sampah & perencanaan pengembangan Bank Sampah."
    ],
    [
      Icons.card_giftcard,
      "SISTEM POIN",
      "Selain menukarkan sampah jenis tertentu dengan uang, TrashSure juga memberikan poin yang dapat anda kumpulkan dan tukarkan kemudain dengan beberapa hadiah menarik yang tersedia."
    ]
  ];

  @override
  void initState() {
    super.initState();
    pageController =
        PageController(initialPage: 0, viewportFraction: viewportFraction)
          ..addListener(() {
            setState(() {
              pageOffset = pageController!.page;
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: listItem.length,
        itemBuilder: ((context, index) {
          double angle = (pageOffset! - index).abs();

          if (angle > 0.5) {
            angle = 1 - angle;
          }
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            alignment: Alignment.center,
            child: Material(
              color: const Color.fromARGB(255, 245, 245, 245),
              elevation: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color.fromARGB(255, 5, 89, 91),
                ),
                width: double.infinity,
                height: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      listItem[index][0],
                      size: 120,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      listItem[index][1],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black54),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      listItem[index][2],
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}