import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Widget> myTabs = const [
    Tab(text: 'one'),
    Tab(text: 'two'),
    Tab(text: 'three'),
  ];

  TabController? _tabController;

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController!.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController!.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            tabs: myTabs,
          ),
          Center(
            child: [
              const  Padding(
                padding: EdgeInsets.all(25),
                child: Text('first tab'),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.green),
                child: Column(
                  children: [
                    const Text("1"),
                    Container(
                      decoration: BoxDecoration(color: Colors.amber),
                      height: 200,
                      width: 100,
                    ),
                    const Icon(
                      Icons.favorite,
                      size: 25,
                    )
                  ],
                ),
              ),
              Container(
                color: Colors.amber,
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          "“With Lou, customers know immediately when a new feature is launched and are able to learn about that feature in a highly engaging way.”"),
                    ),
                  ],
                ),
              ),
            ][_tabController!.index],
          ),
        ],
      ),
    );
  }
}
