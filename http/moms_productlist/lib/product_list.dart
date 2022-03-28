import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:moms_productlist/const.dart';
import 'package:moms_productlist/data_class.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<List<Data>>? futureData;

  Future<List<Data>> fetchData() async {
    final response = await http
        .get(Uri.parse('http://mumz.gitdr.com/api/viewproduct?m_id=2'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      print('USER_DETAILS$jsonResponse');

      return jsonResponse.map((data) => new Data.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: col10,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder<List<Data>>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Data>? data = snapshot.data;
                      return Expanded(
                        child: data!.isNotEmpty
                            ? StaggeredGridView.countBuilder(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image:
                                              data[index].productImage == null
                                                  ? NetworkImage(data[index]
                                                      .productImage
                                                      .toString())
                                                  : NetworkImage(
                                                      noImage,
                                                    ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        width: 140,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color:
                                                Colors.white.withOpacity(0.5)),
                                        child: Center(
                                            child:
                                                Text(data[index].productName)),
                                      ),
                                    ),
                                  );
                                },
                                staggeredTileBuilder: (index) {
                                  return StaggeredTile.count(
                                      1, index.isOdd ? 1.2 : 1.4);
                                })
                            : const Text('No results found'),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    // By default show a loading spinner.
                    return CircularProgressIndicator();
                  },
                ),
              ],
            ),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: mainButton(
                    buttonText: "Add products",
                    context: context,
                    onpress: () {}))
          ]),
        ));
  }
}
