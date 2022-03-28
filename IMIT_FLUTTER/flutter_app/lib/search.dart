import 'package:flutter/material.dart';

class Searchoption extends StatelessWidget {
  const Searchoption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            height: 60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.amber),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.search,
                      ),
                      labelText: "Searching of Restaurants",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
