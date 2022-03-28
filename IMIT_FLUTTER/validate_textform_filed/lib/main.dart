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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    label: Text(
                      "Email",
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter text";
                    }
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    label: Text(
                      "Password",
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter text";
                    }
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    print(emailController.text);
                    print(passwordController.text);
                  },
                  child: const Text("Validate"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
