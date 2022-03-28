import 'package:flutter/material.dart';
import 'package:rest_api_example/followers.dart';

class Profole extends StatefulWidget {
  @override
  _ProfoleState createState() => _ProfoleState();
}


class _ProfoleState extends State<Profole> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              profileImage(),
              SizedBox(height: 60),
              Text(
                "Name",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Text(
                    "Email Address",
                  )),
              Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                  "Phone Number",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(250, 40)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Followers()));
                  },
                  child: Text("Followers"))
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileImage() {
  return Container(
    height: 250,
    width: 500,
    decoration: BoxDecoration(color: Colors.blue),
    child: Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(
                  "https://nuvisotesting.com/wp-content/uploads/2021/05/8b167af653c2399dd93b952a48740620.jpg"),
            ),
          )
        ],
      ),
    ),
  );
}

