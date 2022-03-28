import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:search_list_with_api/data/user_data.dart';
import 'package:search_list_with_api/data/user_detail_page.dart';

class Local_Type_Ahead extends StatefulWidget {
  const Local_Type_Ahead({Key? key}) : super(key: key);

  @override
  _Local_Type_AheadState createState() => _Local_Type_AheadState();
}

class _Local_Type_AheadState extends State<Local_Type_Ahead> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16),
        child: TypeAheadField<User?>(
          hideSuggestionsOnKeyboardHide: false,
          debounceDuration: Duration(milliseconds: 500),
          textFieldConfiguration: const TextFieldConfiguration(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: "Search User Name")),
          suggestionsCallback: UserData.getSuggestions,
          itemBuilder: (context, User? suggestion) {
            final user = suggestion!;
            return ListTile(
              leading: Container(
                width: 60,
                height: 60,
                child: Image.network(
                  user.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(user.name),
            );
          },
          noItemsFoundBuilder: (context) => Container(
            height: 100,
            child: const Center(
              child: Text("No users Found"),
            ),
          ),
          onSuggestionSelected: (User? suggestion) {
            final user = suggestion!;

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserDetails(
                      user: user,
                    )));
          },
        ),
      ),
    );
  }
}
