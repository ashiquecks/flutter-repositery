import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:textfiled_multiplicate/provider_demo.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    var providerData = Provider.of<ProviderDemo>(context, listen: true);
    return Scaffold(
      body: Center(
        child: ListView.builder(
            itemCount: providerData.skills.length,
            itemBuilder: (context, index) {
              return Text(
                providerData.skills[index],
                style: TextStyle(fontSize: 40, color: Colors.black),
              );
            }),
      ),
    );
  }
}
