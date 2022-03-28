import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

DateTime? chosenDateTime;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Container(
                    height: 280,
                    decoration: const BoxDecoration(color: Colors.black),
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: const BoxDecoration(color: Colors.black),
                          child: CupertinoTheme(
                            data: const CupertinoThemeData(
                                brightness: Brightness.dark),
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime(
                                1969,
                                1,
                                1,
                              ),
                              onDateTimeChanged: (value) {
                                setState(() {
                                  chosenDateTime = value;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Divider(
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                print(
                                  DateFormat("dd-MM-yyyy")
                                      .format(chosenDateTime!),
                                );
                              },
                              child: const Text(
                                "confirm",
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 1,
                              decoration:
                                  const BoxDecoration(color: Colors.yellow),
                            ),
                            const InkWell(
                              child: Text(
                                "confirm",
                                style: TextStyle(color: Colors.yellow),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: const Text("Click"),
        ),
      ),
    );
  }
}
