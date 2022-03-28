import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('search'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: FoodItemSearch());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
    );
  }
}

class FoodItemSearch extends SearchDelegate<FoodItem> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text(query));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? loadFoodItem()
        : loadFoodItem().where((p) => p.title.startsWith(query)).toList();
    return mylist.isEmpty
        ? Text("No Result Found..")
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final FoodItem listitem = mylist[index];
              return ListTile(
                onTap: () {
                  showResults(context);
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(listitem.title),
                    Text(listitem.category)
                  ],
                ),
              );
            });
  }
}

class FoodItem {
  final String title;
  final String category;
  FoodItem({
    required this.title,
    required this.category,
  });
}

List<FoodItem> loadFoodItem() {
  var fi = <FoodItem>[
    FoodItem(title: 'choclate cake', category: "cake"),
    FoodItem(
      title: "shake",
      category: "milkshake",
    ),
    FoodItem(
      title: "noodels",
      category: "chinese",
    ),
    FoodItem(title: "spring rolls", category: "chinese"),
  ];
  return fi;
}
