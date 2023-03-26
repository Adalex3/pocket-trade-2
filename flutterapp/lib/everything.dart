import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'homepage.dart';
import 'firebase.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({super.key});

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final List<Widget> widgets = [
      Card(
        color: const Color(0xFFACC6AA),
        child: SizedBox(
          height: height,
          width: width * 0.7,
          child: Image.asset('assets/Exchange.png', fit: BoxFit.cover),
        ),
      ),
      Card(
        color: const Color(0xFFACC6AA),
        child: SizedBox(
          height: height,
          width: width * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Center(
                            child: Text("About Our Mission",
                                style: GoogleFonts.signikaNegative(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                            height: 75,
                            width: 75,
                            child: Image.asset('assets/community.png',
                                fit: BoxFit.contain)),
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Center(
                            child: Text(
                              "Consumerism is a cultural and economic phenomenon that encourages people to buy more goods than they need, often resulting in overconsumption and waste. The effects of consumerism on sustainability have become increasingly apparent in recent years with pollution, loss of biodiversity, and climate change. As global demand for consumer goods continues to rise, so does the pressure on natural resources and ecosystems. ",
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 22.5, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Center(
                            child: Text(
                              "To address these issues, Pocket Trade was created to promote sustainability, recyclability, and conservation of resources. The app allows for individuals to List Items, Set Up Meetings, and Trade with people around the area. Without a monetary barrier, people are able to determine the material worth of their own belongings and expect something in return when giving an object up. By trading, people learn to embrace sustainable consumption, commit to a conscientious conservation of material goods, and protect the environment, all while empowering community bonds.",
                              style: GoogleFonts.signikaNegative(
                                fontSize: 22.5,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      Card(
        color: const Color(0xFFACC6AA),
        child: SizedBox(
          height: height,
          width: width * 0.7,
          child: Image.asset('assets/HandShake.jpg', fit: BoxFit.cover),
        ),
      ),
      Card(
        color: const Color(0xFFACC6AA),
        child: SizedBox(
          height: height,
          width: width * 0.7,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Center(
                            child: Text("Getting Started",
                                style: GoogleFonts.signikaNegative(
                                    fontSize: 36,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                            height: 125,
                            width: 250,
                            child: Image.asset('assets/forms.png',
                                fit: BoxFit.fitHeight)),
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Center(
                            child: Text(
                              "1. Go to the “Items” button to see listings in your area",
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: Center(
                            child: Text(
                              "2. To upload an item to trade, click the “Forms” icon",
                              style: GoogleFonts.signikaNegative(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 32, left: 32, right: 32, bottom: 4),
                          child: Center(
                            child: Text(
                              "3. To trade, install our app to find a trading offer, ",
                              style: GoogleFonts.signikaNegative(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: Text(
                              "set up a meeting, and Pocket Trade!",
                              style: GoogleFonts.signikaNegative(
                                fontSize: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ];

    void initState() {
      super.initState();
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 95,
        backgroundColor: const Color.fromRGBO(246, 241, 230, 1),
        title: Row(
          children: [
            SizedBox(
                height: 120,
                width: 120,
                child: Image.asset('images/logo.png', fit: BoxFit.cover)),
            SizedBox(width: 15),
            SizedBox(
              height: 45,
              child: Text(
                "Pocket Trade",
                style: GoogleFonts.signikaNegative(
                  fontSize: 40,
                  color: const Color(0xFFACC6AA),
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            Expanded(child: Container()),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 30,
              width: 150,
              child: FittedBox(
                fit: BoxFit.contain,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFACC6AA),
                  ),
                  child: Text("Items", style: GoogleFonts.signikaNegative()),
                  //The red button's functions.
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1000),
                        transitionDuration: const Duration(milliseconds: 1000),
                        pageBuilder:
                            ((context, animation, secondaryAnimation) =>
                                ManuallyControlledSlider()),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          const curve = Curves.easeOutSine;

                          final tween = Tween(begin: begin, end: end);
                          final curvedAnimation = CurvedAnimation(
                            parent: animation,
                            curve: curve,
                          );

                          return SlideTransition(
                            position: tween.animate(curvedAnimation),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: 30,
              width: 150,
              child: FittedBox(
                fit: BoxFit.contain,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFACC6AA),
                  ),
                  child: Text("Forms", style: GoogleFonts.signikaNegative()),
                  //The red button's functions.
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        reverseTransitionDuration:
                            const Duration(milliseconds: 1000),
                        transitionDuration: const Duration(milliseconds: 1000),
                        pageBuilder:
                            ((context, animation, secondaryAnimation) =>
                                const FireBasePage(
                                  title: 'test',
                                )),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          const curve = Curves.easeOutSine;

                          final tween = Tween(begin: begin, end: end);
                          final curvedAnimation = CurvedAnimation(
                            parent: animation,
                            curve: curve,
                          );

                          return SlideTransition(
                            position: tween.animate(curvedAnimation),
                            child: child,
                          );
                        },
                      ),
                      (route) => false,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Color(0xFF77628C),
            height: 8.0,
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 236, 240, 236),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 0.8,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 15),
            ),
            items: widgets,
          );
        },
      ),
    );
  }
}
