import 'package:flutter/material.dart';
import 'package:msstepper_widget/stepper_widget.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Colors.grey[200]),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SteperWidget()));
          },
          child: const Text("share your brand",
              style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
