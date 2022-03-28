import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late File imageFile;
  final picker = ImagePicker();

  Future chooseImage(ImageSource source) async {
    var pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile?.path != null) {
      setState(() {
        imageFile = File(pickedFile.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(color: Colors.grey[200]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    chooseImage(ImageSource.camera);
                  },
                  child: const Text("camara"),
                ),
                ElevatedButton(
                  onPressed: () {
                    chooseImage(ImageSource.gallery);
                  },
                  child: const Text("gallery"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
