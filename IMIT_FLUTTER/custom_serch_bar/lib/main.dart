import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int toggle = 1;

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController searchControll = TextEditingController();

  AnimationController? con;

  @override
  void initState() {
    super.initState();
    con =
        AnimationController(vsync: this, duration: Duration(microseconds: 375));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Container(
          height: 100.0,
          width: 250.0,
          alignment: const Alignment(-1.0, 0.0),
          child: AnimatedContainer(
            duration: const Duration(microseconds: 375),
            height: 48.0,
            width: (toggle == 0) ? 48.0 : 250.0,
            curve: Curves.easeOut,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      spreadRadius: -10.0,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0))
                ]),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(milliseconds: 375),
                  top: 6.0,
                  left: 7.0,
                  curve: Curves.easeOut,
                  child: AnimatedOpacity(
                    opacity: (toggle == 0) ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 200),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color(0xfff2f3f7),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: AnimatedBuilder(
                        child: Icon(
                          Icons.mic,
                          size: 20.0,
                        ),
                        builder: (context, widget) {
                          return Transform.rotate(angle: con!.value * 2.0 * pi,child: widget,);
                        },
                        animation: con,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

// AnimSearchBar(
            
//             width: 400,
//             textController: searchControll,
//             onSuffixTap: () {
//               setState(() {
//                 searchControll.clear();
//               });
//             }),
