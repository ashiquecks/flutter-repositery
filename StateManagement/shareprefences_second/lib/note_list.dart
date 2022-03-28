
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteList extends StatefulWidget {
  const NoteList({Key? key}) : super(key: key);

  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  String? noteValue;

  @override
  void initState() {
    super.initState();
    getNoteData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: noteValue == null
              ? const Text('Not Notes Available')
              : Text(noteValue!)),
    );
  }

  Future<void> getNoteData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    noteValue = pref.getString('noteData');

    setState(() {});
  }
}
