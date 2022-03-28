import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_postcreate/model_data.dart';

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

Future<CreateData?> createUser(String name, String jobTitle) async {
  final response =
      await http.post(Uri.parse("https://reqres.in/api/users"), body: {
    "name": name,
    "job": jobTitle,
  });

  if (response.statusCode == 201) {
    final String responseString = response.body;

    print(response);

    print(responseString);

    return createDataFromJson(responseString);
  } else {
    return null;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Name"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("job"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  final String userName = nameController.text;
                  final String userJobitle = jobController.text;

                  final CreateData? create =
                      await createUser(userName, userJobitle);
                },
                child: const Text("Upload"))
          ],
        ),
      ),
    );
  }
}
