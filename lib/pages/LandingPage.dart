import 'package:flutter/material.dart';
import 'package:trashsure/pages/Auth/LoginPage.dart';
import 'package:trashsure/pages/Auth/RegisterPage.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController controller = ScrollController();

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
                color: Colors.grey[850],
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
                              color: Colors.white,
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
                color: Colors.grey[850],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Fitur",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
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
                height: MediaQuery.of(context).size.height / 1.15,
                color: Colors.grey[850],
                child: Column(
                  children: const [
                    Text(
                      "Testimoni",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
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
                            color: Colors.white,
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
    // TODO: implement initState
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
              color: Colors.grey[850],
              elevation: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff0059a5), Colors.grey],
                  ),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.pink,
                        blurRadius: 12,
                        offset: Offset(3, 10))
                  ],
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
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      listItem[index][1],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white70),
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
                          color: Colors.white),
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
