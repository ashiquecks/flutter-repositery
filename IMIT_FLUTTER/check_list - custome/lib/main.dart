import 'dart:convert';
import 'package:flutter/material.dart';

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
  bool _isChecked = true;

  List<Map> availableSkill = [
    {"name": "photography", "isChecked": false},
    {"name": "choreography", "isChecked": false},
    {
      "name": "video editor",
      "isChecked": false,
    },
    {"name": "writer", "isChecked": false},
    {"name": "script writer", "isChecked": false}
  ];

  List selectedSkill = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckBox in ListView Example"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                  children: availableSkill.map(
                (skill) {
                  return CheckboxListTile(
                    value: skill["isChecked"],
                    title: Text(skill["name"]),
                    onChanged: (selectedItems) {
                      setState(
                        () {
                          skill["isChecked"] = selectedItems;
                          selectedSkill.add(skill["name"]);
                        },
                      );
                    },
                  );
                },
              ).toList()),
              Wrap(
                children: availableSkill.map((selectedSkill) {
                  if (selectedSkill["isChecked"] == true) {
                    return Text(
                      selectedSkill["name"],
                      style: const TextStyle(color: Colors.white),
                    );
                  }
                  return Container();
                }).toList(),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // selectedSkill.forEach((value) {
                    //   print(value);
                    // });

                    // selectedSkill.forEach((key) {
                    //   print(key);
                    // });
                    print(selectedSkill);
                    // print(selectedSkill.length);
                    // print(selectedSkill.first);
                    // print(selectedSkill.elementAt(1));
                  },
                  child: const Text("NEXT"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
