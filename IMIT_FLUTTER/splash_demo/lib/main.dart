import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initTimer();
  }

  void initTimer() async {
    if (await checkinternet()) {
      Timer(const Duration(seconds: 5), () async {
        setVisitingFlag();

        if (await getVsitingFlag() == true) {
          Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => new HomePage()));
        } else {
          await Navigator.of(context).pushReplacement(
              new MaterialPageRoute(builder: (context) => new NewUser()));
        }
      });
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NetWork()));
    }
  }

  Future<bool> checkinternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "SPLASH SCREEN",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }

  setVisitingFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("alreadyVisited", true);
  }

  getVsitingFlag() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool alreadyVisited = preferences.getBool("alreadyVisited") ?? false;
    return alreadyVisited;
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HOME PAGE"),
      ),
    );
  }
}

class NetWork extends StatelessWidget {
  const NetWork({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "NOT INTERNET CONNECTION",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}

class NewUser extends StatelessWidget {
  const NewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "YOU ARE NEW USER",
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
