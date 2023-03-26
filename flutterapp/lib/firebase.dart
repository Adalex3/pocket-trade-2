import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutterapp/everything.dart';
import 'package:flutterapp/homepage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:io';

class FireBasePage extends StatefulWidget {
  const FireBasePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FireBasePage> createState() => _FireBasePageState();
}

class _FireBasePageState extends State<FireBasePage> {
  final _formKey = GlobalKey<FormState>();
  String _type = '';
  String _title = '';
  String _image = '';
  String _name = '';
  String _date = '';
  String _description = '';

  MediaInfo? _imageInfo;

  late Map<String, String> dataToSave;

  final TextEditingController _controllerType = TextEditingController();
  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerImage = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerDate = TextEditingController();
  final TextEditingController _controllerDescription = TextEditingController();

  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> add(Map<String, String> temp) {
    return users.add(temp).then((value) => print("Success"));
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AlertDialog(
          title: Text('User Info'),
          content: Text('This is some user info.'),
        );
      },
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Do something with the form data

      if (_imageInfo == null) return;
      final firebaseStorageLocation = FirebaseStorage.instance.ref();
      final imageInfo = _imageInfo as MediaInfo;
      _imageInfo as MediaInfo;
      final firebasefileLocation = firebaseStorageLocation
          .child('${DateTime.now()}_${imageInfo.fileName!}');

      await firebasefileLocation.putData(imageInfo.data!);
      final urlToUseLater = await firebasefileLocation.getDownloadURL();

      dataToSave = {
        'Type': _controllerType.text,
        'Title': _controllerTitle.text,
        'Image': urlToUseLater,
        'Name': _controllerName.text,
        'Date': _controllerDate.text,
        'Description': _controllerDescription.text,
      };

      users.add(dataToSave);
      _controllerType.clear();
      _controllerTitle.clear();
      _controllerName.clear();
      _controllerDate.clear();
      _controllerDescription.clear();
      setState(() {
        _imageInfo = null;
      });
    }
  }

  Future<void> imagePick() async {
    var fileInfo = await ImagePickerWeb.getImageInfo;
    if (fileInfo?.data == null) return;
    setState(() {
      _imageInfo = fileInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
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
          ],
        ),
        actions: [
          SizedBox(
            height: 30,
            width: 180,
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
                      pageBuilder: ((context, animation, secondaryAnimation) =>
                          FrontPage()),
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
          SizedBox(width: 30),
          SizedBox(
            height: 30,
            width: 180,
            child: FittedBox(
              fit: BoxFit.contain,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFACC6AA),
                ),
                child: Text("Items", style: GoogleFonts.signikaNegative()),
                //The red button's functions.
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageRouteBuilder(
                      reverseTransitionDuration:
                          const Duration(milliseconds: 1000),
                      transitionDuration: const Duration(milliseconds: 1000),
                      pageBuilder: ((context, animation, secondaryAnimation) =>
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
                    (route) => false,
                  );
                },
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Color(0xFF77628C),
            height: 8.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: deviceWidth * 0.70,
            height: deviceHeight * 0.90,
            child: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color.fromARGB(255, 214, 234, 212),
                child: Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Form(
                    key: _formKey,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          if (_imageInfo != null)
                            SizedBox(
                                height: 300,
                                width: 400,
                                child: Image.memory(_imageInfo!.data!,
                                    fit: BoxFit.fitWidth)),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: _controllerType,
                              decoration:
                                  const InputDecoration(labelText: 'Type'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the type of item.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _type = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: _controllerTitle,
                              decoration:
                                  const InputDecoration(labelText: 'Title'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the title for the item.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _title = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: _controllerName,
                              decoration:
                                  const InputDecoration(labelText: 'Name'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the name of the item.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _name = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: _controllerDate,
                              decoration:
                                  const InputDecoration(labelText: 'Date'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter the date for the item.';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _date = value!;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SizedBox(
                              height: 70.0,
                              child: TextFormField(
                                controller: _controllerDescription,
                                decoration: const InputDecoration(
                                    labelText: 'Description'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a description for the item.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _description = value!;
                                },
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 64.0, right: 64.0),
                            child: Row(
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 78, 91, 78),
                                    ),
                                    onPressed: () async => imagePick(),
                                    child: Text("Upload Image",
                                        style: GoogleFonts.signikaNegative())),
                                Expanded(child: Container()),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(255, 78, 91, 78),
                                  ),
                                  onPressed: _submitForm,
                                  child: Text('Submit',
                                      style: GoogleFonts.signikaNegative()),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
