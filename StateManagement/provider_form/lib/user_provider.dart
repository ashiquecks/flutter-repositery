import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  String? name;
  String? address;
  String? pin;
  String? phoneNumber;

  void changeValueForname({name}) {
    this.name = name;
    notifyListeners();
  }

  void changeValueForAddress({address}) {
    this.address = address;
    notifyListeners();
  }

  void changeValueForPin({pin}) {
    this.pin = pin;
    notifyListeners();
  }

  void changeValueForPhone({phoneNumber}) {
    this.phoneNumber = phoneNumber;
    notifyListeners();
  }
}
