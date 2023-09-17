// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';
import 'package:trashsure/utils/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final double screenHeight = MediaQuery.of(context).size.height;
    void scrollDown() {
      controller.animateTo(
        controller.offset + screenHeight,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: controller,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight,
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
                                        "Pelajari lebih lanjut",
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
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 80),
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
          return Transform(
            transform: Matrix4.identity()..setEntry(3, 2, 0.001),
            alignment: Alignment.center,
            child: Material(
              color: const Color.fromARGB(255, 245, 245, 245),
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
