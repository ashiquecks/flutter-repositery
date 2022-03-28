import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:profile_view/profile_model.dart';

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
      home: ProfileView(),
    );
  }
}

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

Future<List<ProfileData?>?> createUser() async {
  final response = await http.get(
    Uri.parse("http://mumz.gitdr.com/api/getmom?phone_number=9387942223"),
  );

  if (response.statusCode == 200) {
    var responseString = response.body;

    final data = profileDataFromJson(responseString);
    
    print(responseString);


    return profileDataFromJson(responseString);
  } else {
    return null;
  }
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              createUser();
              print("button click");
            },
            child: Text("uplaod")),
      ),
    );
  }
}
