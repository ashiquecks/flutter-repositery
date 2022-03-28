import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? user_name, user_id, user_password;

  @override
  void initState() {
    super.initState();
    getValues();
  }

  void getValues() async {

    SharedPreferences sharedData = await SharedPreferences.getInstance();

    setState(() {
      user_name = sharedData.getString('email');
      user_id = sharedData.getString('name');
      user_password = sharedData.getString('password');
    });
    
    print('user_name : ${user_name}');
    print('user_id : ${user_id}');
    print('user_password : ${user_password}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            Text(
              user_name == null ? "NO Value" : user_name!,
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              user_id == null ? "NO Value" : user_id!,
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              user_password == null ? "NO Value" : user_password!,
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
