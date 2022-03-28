import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:listview_ml/passenger_data.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
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
  late int totalPage;
  int currentPage = 1;

  List<Passenger> passengers = [];

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<void> getPassengerData({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
    } else {
      if (currentPage >= totalPage) {
        refreshController.loadNoData();
        return true;
      }
    }
    final Uri uri = Uri.parse(
        "https://api.instantwebtools.net/v1/passenger?page=$currentPage&size=10");

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final result = passengerDataFromJson(response.body);

      passengers = result.data;
      currentPage++;

      totalPage = result.data as int;
      print(response.body);
      setState(() {});
    } else {
      false;
    }
  }

  @override
  void initState() {
    super.initState();
    getPassengerData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listview"),
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () async {
          final result = await getPassengerData(isRefresh: true);
          if (result) {
            refreshController.refreshCompleted();
          } else {
            refreshController.refreshFailed();
          }
        },
        onLoading: () async {
          final result = await getPassengerData();
          if (result) {
            refreshController.loadComplete();
          } else {
            refreshController.loadFailed();
          }
        },
        child: ListView.separated(
            itemBuilder: (context, index) {
              final passenger = passengers[index];

              return ListTile(
                title: Text(passenger.name),
                subtitle: Text(passenger.airline.toString()),
                trailing: Text(passenger.trips.toString()),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: passengers.length),
      ),
    );
  }
}
