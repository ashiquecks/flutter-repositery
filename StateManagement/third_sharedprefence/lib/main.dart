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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  void setValue() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString('user_name', 'ashique');
    sharedPreferences.setString('user_id', '8120');
    sharedPreferences.setString('notification', 'on');
  }

  void getValues() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? user_name = sharedPreferences.getString('user_name');
    String? user_id = sharedPreferences.getString('user_id');
    String? notification = sharedPreferences.getString('notification');

    print('user_name : ${user_name}');
    print('user_name : ${user_id}');
    print('user_name : ${notification}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Column(
        children: [
          ElevatedButton(
            child: const Text("Set Value"),
            onPressed: () async {
              setValue();
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text("Set Value"),
            onPressed: () async {
              getValues();
            },
          ),
        ],
      )),
    );
  }
}
