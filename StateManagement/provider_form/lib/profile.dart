import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_form/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var providerData = Provider.of<UserProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Text(
              providerData.name.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              providerData.address.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              providerData.pin.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              providerData.phoneNumber.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
