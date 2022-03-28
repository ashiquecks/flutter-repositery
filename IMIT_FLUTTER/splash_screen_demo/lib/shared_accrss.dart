import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_demo/main.dart';

class SharedAccess extends StatefulWidget {
  const SharedAccess({Key? key}) : super(key: key);

  @override
  _SharedAccessState createState() => _SharedAccessState();
}

class _SharedAccessState extends State<SharedAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            bool visitingFlag = await getVsitingFlag();

            setVisitingFlag();

            if (visitingFlag == true) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => NewUser()));
            }
          },
          child: Text("proceed"),
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
