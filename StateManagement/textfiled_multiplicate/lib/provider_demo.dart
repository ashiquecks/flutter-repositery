import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderDemo with ChangeNotifier {
  Widget textFiled() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: TextFormField(
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            label: Text("Skill"),
          ),
        ),
      ),
    );
  }
}
