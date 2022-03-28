import 'package:flutter/material.dart';
import 'package:flutter_tab_bar/tab_screen.dart';

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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: homeAppbar(context: context),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 5),
              height: 100,
              child: AppBar(
                backgroundColor: Colors.lightBlue,
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: const Size(double.infinity, 100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TabBar(
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 5.0),
                        indicatorSize: TabBarIndicatorSize.label,
                        unselectedLabelColor: Colors.lightBlue,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue),
                        isScrollable: true,
                        tabs: [
                          tabCard(),
                          tabCard(),
                          tabCard(),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 600,
              child: const TabBarView(
                children: [
                  TabScreen(),
                  TabScreen(),
                  TabScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget tabCard() {
  return Tab(
    height: 70,
    child: Container(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.blue, width: 1)),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOHLCWdUmHI4wPHPrOnd5sP1K00MzrDW93tA&usqp=CAU",
              height: 50,
              width: 50,
            ),
            const Text(
              "Backer",
            )
          ],
        ),
      ),
    ),
  );
}

homeAppbar({required BuildContext context}) {
  return AppBar(
    backgroundColor: Colors.blue,
    elevation: 0,
    leadingWidth: 0,
    title: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/MainRootScreen');
          },
          child: const Text(
            "Moms Kitchen",
            style: TextStyle(fontSize: 15, color: Colors.lightBlue),
          ),
        )),
    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/order_history');
        },
        icon: const Icon(
          Icons.history,
          color: Colors.lightBlue,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/Cart_screen');
        },
        icon: const Icon(
          Icons.shopping_cart,
          color: Colors.lightBlue,
        ),
      ),
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/Notification_Screen');
        },
        icon: const Icon(
          Icons.notifications_outlined,
          color: Colors.lightBlue,
        ),
      ),
    ],
  );
}
