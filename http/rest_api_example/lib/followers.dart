import 'package:flutter/material.dart';
import 'package:rest_api_example/sampleData.dart';

class Followers extends StatefulWidget {
  const Followers({Key? key}) : super(key: key);

  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back))
        ),
        body: ListView.builder(
          itemCount: categories.length,  
          itemBuilder: (context, index) {
            return Container(
              padding:EdgeInsets.all(15),
              decoration: BoxDecoration(border: Border.all(color: Colors.blue,)),
              child: Row(
              children: [
                CircleAvatar(backgroundImage: NetworkImage("https://nuvisotesting.com/wp-content/uploads/2021/05/8b167af653c2399dd93b952a48740620.jpg"),),
                SizedBox(width: 60,),
                Column(
                    children: [
                      Text(categories[index].name,
                          style: TextStyle(
                            fontSize: 16,
                          )),
                      SizedBox(height: 15),
                      Text(categories[index].phone,
                          style: TextStyle(fontSize: 16))
                    ],
                  ),
              ],
            ),
            );
          },
        ),
      ),
    );
  }
}
