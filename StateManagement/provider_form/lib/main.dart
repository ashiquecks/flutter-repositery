import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_form/profile.dart';
import 'package:provider_form/user_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
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

  final TextEditingController nameControll = TextEditingController();
  final TextEditingController addressControll = TextEditingController();
  final TextEditingController pinControll = TextEditingController();
  final TextEditingController phoneControll = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var providerData = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: nameControll,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: 'EnterYourName'),
              keyboardType: TextInputType.name,
            ),
            TextFormField(
              controller: addressControll,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: 'EnterYourAddess'),
              keyboardType: TextInputType.name,
            ),
            TextFormField(
              controller: pinControll,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: 'EnterYourPin'),
              keyboardType: TextInputType.name,
            ),
            TextFormField(
              controller: phoneControll,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(labelText: 'EnterYourPhone'),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                providerData.changeValueForname(name: nameControll.text);
                providerData.changeValueForAddress(
                    address: addressControll.text);
                providerData.changeValueForPin(pin: pinControll.text);
                providerData.changeValueForPhone(
                    phoneNumber: phoneControll.text);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: const Text("Conform"),
            ),
          ],
        ),
      ),
    );
  }
}
