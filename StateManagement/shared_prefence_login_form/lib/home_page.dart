import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferences? loginData;
  String? userName;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    var loginData = await SharedPreferences.getInstance();
    setState(() {
      userName = loginData.getString('userName');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(26),
        child: Column(
          children: [
            Text("$userName"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Logout"))
          ],
        ),
      ),
    );
  }
}
