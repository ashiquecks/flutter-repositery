import 'package:flutter/material.dart';
import 'package:search_list_with_api/data/user_data.dart';

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: ListView(
        children: [
          Image.network(
            user.imageUrl,
            height: 300,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            user.name,
            style: TextStyle(fontSize: 28),
          )
        ],
      ),
    );
  }
}
