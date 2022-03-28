import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo_app/task_model.dart';
import 'package:provider_todo_app/todo_model.dart';

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
        primarySwatch: Colors.blue,
      ),
      // home: ChangeNotifierProvider(builder: (context) => TodoModel().
      //  create: (BuildContext context) {  },
      //  child: MyHomePage(),
      // ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50))),
              child: Consumer<TodoModel>(
                builder: (context, todo, child){
                  return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return const ListTile(
                      contentPadding: EdgeInsets.only(
                          left: 32, right: 32, top: 8, bottom: 8),
                      title: Text(
                        "Make video",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "Make video on provider",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      trailing: Icon(
                        Icons.check_circle,
                        color: Colors.greenAccent,
                      ),
                    );
                  });
                }
              ),
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<TaskModel>(context);
        },
      ),
    );
  }
}
