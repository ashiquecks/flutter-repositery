import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ImagePicker _picker = ImagePicker();
  bool _obscureText = true;
  XFile? image;

  File? _pickedImage;

  XFile? get selectImage => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SizedBox(
        height: 10,
      ),
      SizedBox(
        height: 80,
        width: 80,
        child: Card(
          elevation: 4,

          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
            backgroundImage:
                _pickedImage == null ? null : FileImage(_pickedImage!),
            child: RawMaterialButton(
                child: Icon(Icons.camera_alt_rounded),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text(
                            "Choose option",
                            style: TextStyle(
                                fontWeight: FontWeight.w100,
                                color: Colors.black),
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: [
                                InkWell(
                                  onTap: _pickImageCamera,
                                  splashColor: Colors.black,
                                  child: Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.camera,
                                          color: Colors.purpleAccent,
                                        ),
                                      ),
                                      Text(
                                        "Camera",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: _pickImageGallery,
                                  splashColor: Colors.black,
                                  child: Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.image,
                                          color: Colors.purpleAccent,
                                        ),
                                      ),
                                      Text(
                                        "Gallery",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ),
          //child: Icon(Icons.camera_enhance_rounded),
        ),
      ),
    ]));
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  Future<void> _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }
}
