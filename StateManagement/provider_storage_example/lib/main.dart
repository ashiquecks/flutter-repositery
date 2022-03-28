import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderDemo(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProviderDemo2(),
        ),
      ],
      child: MaterialApp(home: Page1()),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("page1 rebuild");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page2()));
              },
              child: Text("Page1"),
            ),
            Consumer<ProviderDemo>(builder: (context, value, child) {
              print("Consumer rebuild");
              return Text(value.test1);
            }),
            TextButton(
              onPressed: () {
                Provider.of<ProviderDemo>(context, listen: false)
                    .changeValue("New Coding..");
              },
              child: Text("Change value"),
            ),
            Provider.of<ProviderDemo>(context, listen: false).titleText(),
            Provider.of<ProviderDemo>(context, listen: false).containerWidget(),
            Provider.of<ProviderDemo>(context, listen: false).containerWidget(),
            Provider.of<ProviderDemo>(context, listen: false).titleText()
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page3()));
              },
              child: Text("Page2"),
            ),
            Text(Provider.of<ProviderDemo>(context).test1),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Page1()));
              },
              child: Text("Page3"),
            ),
            Text(Provider.of<ProviderDemo>(context).test1),
          ],
        ),
      ),
    );
  }
}
