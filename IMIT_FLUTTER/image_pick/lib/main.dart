import 'dart:html';

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
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                child: Text("Select Image"),
                onPressed: () {
                  filePicker();
                },
              ),
              const SizedBox(
                height: 20,
              ),
              // image == null
              //     ? Text("No Image")
              //     : Image.file(
              //       File(image!.path),
              //     )
            ],
          ),
        ),
      ),
    );
  }

  void filePicker() async {
    final XFile? selectImage = await _picker.pickImage(source: ImageSource.gallery);
    
    setState(() {
      image = selectImage;
    });
  }
}
