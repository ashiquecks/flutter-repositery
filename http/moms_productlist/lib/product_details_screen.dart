import 'package:flutter/material.dart';
import 'package:moms_productlist/const.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String? brandname;
  final image;
  final String? productName;
  final String? rating;
  final String? place;
  final int? price;
  final int? offer;
  final String? stock;
  final String? description;
  final String? des;
  const ProductDetailsScreen(
      {Key? key,
      required String this.brandname,
      required String this.image,
      required String this.productName,
      required String this.rating,
      required int this.offer,
      required String this.place,
      required int this.price,
      required String this.stock,
      required String this.description,
      required String this.des})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: AssetImage(widget.image.toString()),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  top: 8,
                  left: 10,
                  right: 10,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white.withOpacity(0.5)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                widget.brandname.toString(),
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: col3),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/notificationScreen');
                                },
                                icon: const Icon(
                                  Icons.notifications_none,
                                  color: col3,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      widget.productName.toString(),
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: col3),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          widget.rating.toString(),
                          style: TextStyle(color: col3),
                        ),
                        SizedBox(width: 15),
                        Icon(
                          Icons.location_on,
                          color: col3,
                        ),
                        Text(
                          widget.place.toString(),
                          style: TextStyle(color: col3),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Text(
                          widget.price.toString(),
                          style: TextStyle(color: col3),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          widget.offer.toString(),
                          style: TextStyle(color: col3),
                        ),
                        // const Text("Off: 2%",style: TextStyle(color: col3),)
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse,
                          color: col3,
                        ),
                        Text(
                          widget.stock.toString(),
                          style: TextStyle(color: col3),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      widget.description.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: col3),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      widget.des.toString(),
                      style: TextStyle(color: col3, height: 1.5),
                    ),
                  ],
                ),
              ),
              Container(
                  child: mainButton(
                      buttonText: "Update",
                      context: context,
                      onpress: () {
                        Navigator.pushNamed(context, '/productAdding');
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
