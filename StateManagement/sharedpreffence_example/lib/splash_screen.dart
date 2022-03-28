import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreffence_example/home_page.dart';
import 'package:sharedpreffence_example/login_page.dart';

String? finalEmail;

class SplashSceen extends StatefulWidget {
  const SplashSceen({Key? key}) : super(key: key);

  @override
  _SplashSceenState createState() => _SplashSceenState();
}

class _SplashSceenState extends State<SplashSceen> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      if (await getValidationData() == null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    });
    super.initState();
  }

  //Timer(Duration(seconds: 2), () =>  Get.to(finalEmail == null ? LoginPage() : HomePage()));

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');

    setState(() {
      finalEmail = obtainedEmail;
    });

    print(finalEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircleAvatar(
              child: Icon(Icons.local_activity),
              radius: 50.0,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
