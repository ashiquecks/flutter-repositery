import 'package:flutter/material.dart';

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
  bool isCompleeted = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                content: Row(
                  children: [
                    SizedBox(
                        child: isCompleeted
                            ? const CircularProgressIndicator(
                                color: Colors.amber,
                              )
                            : const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 40,
                              )),
                    const SizedBox(
                      width: 40,
                    ),
                    Text(isCompleeted ? "Loading..." : "Success"),
                  ],
                ),
              ),
            );
          },
          child: const Text("checking"),
        ),
      ),
    );
  }
}
