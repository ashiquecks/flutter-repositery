import 'package:flutter/material.dart';
import 'package:shared_prefence_class/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  TextEditingController emailControll = TextEditingController();
  TextEditingController nameControll = TextEditingController();
  TextEditingController passwordControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: emailControll,
              decoration: const InputDecoration(hintText: "Enter Email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: nameControll,
              decoration: const InputDecoration(hintText: "Enter Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: passwordControll,
              decoration: const InputDecoration(hintText: "Enter Password"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: () async {
                SharedPreferences sharedData =
                    await SharedPreferences.getInstance();

                sharedData.setString('email', emailControll.text);
                sharedData.setString('name', nameControll.text);
                sharedData.setString('password', passwordControll.text);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: const Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}
