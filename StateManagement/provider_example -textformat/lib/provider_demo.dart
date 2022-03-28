import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProviderDemo with ChangeNotifier {
  String test1 = "provider example";

  void changeValue(String nextValue) {
    test1 = nextValue;
    notifyListeners();
  }

  Widget containerWidget() {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
    );
  }

  Widget titleText() {
    return Text(
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry.");
  }
}

class ProviderDemo2 with ChangeNotifier {}
