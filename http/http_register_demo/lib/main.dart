import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_register_demo/data_model.dart';


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
      home: MyhomePage(),
    );
  }
}

class MyhomePage extends StatefulWidget {
  const MyhomePage({ Key? key }) : super(key: key);

  @override
  _MyhomePageState createState() => _MyhomePageState();
}

Future<UserModel?> submitData(String name,String job) async{
  var response = await http.post(Uri.parse("https://reqres.in/api/users"), body: {
    "name" : name, "job" : job
  });
  var data = response.body;
  print(data);

  if(response.statusCode == 201){
    String responseString = response.body;
    userModelFromJson(responseString);
  }else{
    return null;
  }
}

//reqres.in","api/users

class _MyhomePageState extends State<MyhomePage> {

  late UserModel _userModel;

  TextEditingController nameController =TextEditingController();
  TextEditingController jobController =TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Enter name"),
            ),

            const SizedBox(height: 15,),

             TextField(
               controller: jobController,
              decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Enter name"),
            ),

            ElevatedButton(onPressed: () async{

              
              String name =nameController.text;
              String job =jobController.text;

              UserModel? data=await submitData(name, job);

              // setState(() {
              //   _userModel =data!;
              // });

            }, child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
