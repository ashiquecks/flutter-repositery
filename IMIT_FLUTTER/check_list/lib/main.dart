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

  List<Map> availableHobbies = [
    {
      "name": "Foobball", 
      "isChecked": false
      },
    {
      "name": "Baseball", 
      "isChecked": false},
    {
      "name": "Video Games",
      "isChecked": false,
    },
    {
      "name": "Readding Books", 
      "isChecked": false
      },
    {
      "name": "Surfling The Internet", 
      "isChecked": false
      }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckBox in ListView Example"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Choose your hobbies:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Column(
                children: availableHobbies.map((hobby) {
              return CheckboxListTile(
                  value: hobby["isChecked"],
                  title: Text(hobby["name"]),
                  onChanged: (newValue) {
                    setState(() {
                      hobby["isChecked"] = newValue;
                    });
                  });
            }).toList()),

            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Wrap(
              children: availableHobbies.map((hobby) {
                if (hobby["isChecked"] == true) {
                  return Card(
                    elevation: 3,
                    color: Colors.amber,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(hobby["name"]),
                    ),
                  );
                }

                return Container();
              }).toList(),
            )
          ]),
        ),
      ),
    );
  }
}
