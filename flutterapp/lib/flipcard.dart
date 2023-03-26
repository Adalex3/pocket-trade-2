import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Flippys {
  final FlipCardController _flipController = FlipCardController();
  late var allData;
  late List<Widget> imageSliders;

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('users');

  Future<void> getFirestore() async {
    QuerySnapshot querySnapshot = await _collectionRef.get();

    allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    imageSliders = allData
        .map<Widget>((item) => FlipCard(
              controller: _flipController,
              fill: Fill.none,
              front: Card(
                color: const Color(0xFF4c3e59),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side:
                        const BorderSide(color: Color(0xFF77628C), width: 3.5)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SizedBox(
                        height: 500 * 0.05,
                        child: Text(item['Type'],
                            style: GoogleFonts.signikaNegative(
                                fontSize: 25, color: const Color(0xFF77628C))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: SizedBox(
                        height: 500 * 0.1,
                        child: Text(
                          item['Title'],
                          style: GoogleFonts.signikaNegative(
                              fontSize: 50, color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: 500 * 0.5,
                          width: 400 * 0.9,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(item['Image']))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                      child: Row(
                        children: [
                          Text("Listed by: ",
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 25,
                                  color: const Color(0xFF77628C))),
                          Text(item['Name'],
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 25, color: Colors.white)),
                          Expanded(
                            child: Container(),
                          ),
                          Text("on ",
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 25,
                                  color: const Color(0xFF77628C))),
                          Text(item['Date'],
                              style: GoogleFonts.signikaNegative(
                                  fontSize: 25, color: Colors.white)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            size: 85,
                            color: Color(0xFF77628C),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              back: Card(
                color: const Color(0xFF4c3e59),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side:
                        const BorderSide(color: Color(0xFF77628C), width: 3.5)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Center(
                                child: Text(
                                  item['Description'],
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.white),
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ))
        .toList();
  }
}
