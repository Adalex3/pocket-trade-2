import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterapp/main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flip_card/flip_card.dart';

import 'firebase.dart';
import 'everything.dart';
import 'flipcard.dart';

class ManuallyControlledSlider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ManuallyControlledSliderState();
  }
}

class _ManuallyControlledSliderState extends State<ManuallyControlledSlider> {
  final CarouselController _controller = CarouselController();
  final Flippys flip = Flippys();
  late List<Widget> cards;

  @override
  void initState() {
    super.initState();
  }

  Future<void> getCards() async {
    await flip.getFirestore();
    cards = flip.imageSliders;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
                  child: Text("Home", style: GoogleFonts.signikaNegative()),
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
                                const FrontPage()),
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
      backgroundColor: const Color(0xFFF9F7F7),
      body: FutureBuilder(
        future: getCards(), // async work
        builder: (BuildContext context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading....');
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
                return Scaffold(
                    floatingActionButton: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Row(
                          children: [
                            FloatingActionButton.large(
                                backgroundColor: Colors.white,
                                child: const Icon(
                                    size: 75,
                                    color: Color(0xFFACC6AA),
                                    Icons.arrow_back_ios_new_rounded),
                                onPressed: () => _controller.previousPage()),
                            Expanded(child: Container()),
                            FittedBox(
                              child: FloatingActionButton.large(
                                  backgroundColor: Colors.white,
                                  child: const Icon(
                                      size: 75,
                                      color: Color(0xFFACC6AA),
                                      Icons.arrow_forward_ios_rounded),
                                  onPressed: () => _controller.nextPage()),
                            )
                          ],
                        ),
                      ),
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Center(
                              child: SizedBox(
                                width: double.infinity,
                                child: CarouselSlider(
                                  items: cards,
                                  options: CarouselOptions(
                                      enlargeCenterPage: true,
                                      height: height * 0.8),
                                  carouselController: _controller,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ));
          }
        },
      ),
    );
  }
}
