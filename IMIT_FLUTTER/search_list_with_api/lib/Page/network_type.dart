import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:search_list_with_api/user_api.dart';

class NetworkTypeAheadPage extends StatefulWidget {
  const NetworkTypeAheadPage({Key? key}) : super(key: key);

  @override
  _NetworkTypeAheadPageState createState() => _NetworkTypeAheadPageState();
}

class _NetworkTypeAheadPageState extends State<NetworkTypeAheadPage> {
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
          suggestionsCallback: UserApi.getUserSuggestion,
          itemBuilder: (context, User? suggestion) {
            final user = suggestion!;
            return ListTile(
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

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text("Selected user : ${user.name}"),
                ),
              );
          },
        ),
      ),
    );
  }
}
