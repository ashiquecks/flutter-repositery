import 'package:shared_preferences/shared_preferences.dart';

class SharedClass {
  void setValue(String email, name, password) async {
    SharedPreferences sharedData = await SharedPreferences.getInstance();

    sharedData.setString('user_email', email);
    sharedData.setString('user_name', name);
    sharedData.setString('user_password', password);
  }
}
