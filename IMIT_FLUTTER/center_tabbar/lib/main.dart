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
      home: profilePage(),
    );
  }
}

class profilePage extends StatefulWidget {
  @override
  profilePageState createState() => profilePageState();
}

class profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Profile',
          ),
          centerTitle: true,
          backgroundColor: Colors.grey[700],
          elevation: 0,
          // give the app bar rounded corners
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          leading: const Icon(
            Icons.menu,
          ),
        ),
        body: Column(
          children: <Widget>[
            // construct the profile details widget here
            const SizedBox(
              height: 180,
              child: Center(
                child: Text(
                  'Profile Details Goes here',
                ),
              ),
            ),

            // the tab bar with two items
            SizedBox(
              height: 50,
              child: AppBar(
                bottom: const TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.directions_bike),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.directions_car,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.train,
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.directions_bike),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.directions_car,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.train,
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.directions_bike),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.directions_car,
                      ),
                    ),
                    Tab(
                      icon: Icon(
                        Icons.train,
                      ),
                    ),
                    Tab(
                      icon: Icon(Icons.directions_bike),
                    ),
                  ],
                ),
              ),
            ),

            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Bike',
                      ),
                    ),
                  ),

                  // second tab bar viiew widget
                  Container(
                    color: Colors.pink,
                    child: const Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.pink,
                    child: const Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),

                  Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Bike',
                      ),
                    ),
                  ),

                  // second tab bar viiew widget
                  Container(
                    color: Colors.pink,
                    child: const Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.pink,
                    child: const Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),

                  Container(
                    color: Colors.pink,
                    child: const Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),

                  Container(
                    color: Colors.red,
                    child: const Center(
                      child: Text(
                        'Bike',
                      ),
                    ),
                  ),

                  // second tab bar viiew widget
                  Container(
                    color: Colors.pink,
                    child: const Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.pink,
                    child: const Center(
                      child: Text(
                        'Car',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
