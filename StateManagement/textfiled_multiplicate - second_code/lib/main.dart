import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textfiled_multiplicate/list_page.dart';
import 'package:textfiled_multiplicate/provider_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ProviderDemo())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController skillController = TextEditingController();

  int textfiledCount = 1;

  String? _offer;

  @override
  Widget build(BuildContext context) {
    var providerData = Provider.of<ProviderDemo>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (contex) => ListPage()));
            },
            child: const Text(
              "View List",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: textfiledCount,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      label: Text("Skill"),
                    ),
                    validator: (value) {},
                    onSaved: (value) {
                      providerData.addValueForSkill(skill: value);
                    },
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            textfiledCount++;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
