import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/brand_name.dart';
import 'package:flutter_app/search.dart';
import 'package:flutter_app/second_page.dart';
import 'package:flutter_app/staggred_shimmer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StaggredShimmer(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int interNetValue = 0;

  Future<void> asyncNetCheck() async {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isEmpty) {
      return Future<void>.value(true);
    }
  }

  void initState() {
    super.initState();
    new Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        interNetValue = 2;
        asyncNetCheck().then((value) {
          interNetValue = 2;
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: interNetValue == 0
              ? Container()
              : interNetValue == 2
                  ? SizedBox(
                      child: Center(
                        child: Text("checking Internet"),
                      ),
                    )
                  : Container()
          // child: internetValue == 0 ? Container(): internetValue == 2? Container(child: Center(child: Text("checking Internet..."),),) : Container()
          ),
    );
  }
}
