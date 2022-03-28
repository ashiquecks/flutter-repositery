import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moms_product_add/const.dart';
import 'package:moms_product_add/product_response_model.dart';
import 'package:path/path.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _UploadProduct() async {
    String photos = basename(_pickedImage!.path);
    try {
      FormData formData = FormData.fromMap({
        "m_id": "5",
        "category": "spicy",
        "price": "540",
        "offerprice": "490",
        "product quantity": "1 kg",
        "piece": "6",
        "date_of_expiry": "12/02/2022",
        "description":
            "This Napa Cabernet is concentrated and shows a purple color with ruby hues.",
        "p_name": "grill chicken",
        "quantity_type": "kg",
        "image":
            await MultipartFile.fromFile(_pickedImage!.path, filename: photos),
      });

      Response response = await Dio()
          .post("http://mumz.gitdr.com/api/addproduct", data: formData);

      var data = response.data;
      print(data);

      if (response == "mom record created") {
        String responseString = response.data;
        productResponseFromJson(responseString);
      } else {
        return null;
      }

      print("File Upload response: $response");
    } catch (e) {}
  }

  final ImagePicker _picker = ImagePicker();
  bool _obscureText = true;
  XFile? image;

  File? _pickedImage;

  XFile? get selectImage => null;

  String? _brandname;
  String? _food;
  String? _mrp;
  String? _offer;
  String? _productqtn;
  String? _piece;
  String? _date;
  String? _description;
  String? choosevalue;
  List<String> listItem = ["Item 1", "Item 2", "Item 3", "Item 4"];
  bool dropButton = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildbrand() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(labelText: 'Enter Your Brand Name'),
      keyboardType: TextInputType.name,
      maxLength: 10,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
          return 'Enter correct brand Name';
        }
        return null;
      },
      onSaved: (value) {
        _brandname = value;
      },
    );
  }

  Widget _buildfood() {
    return DropdownButton(
      hint: const Text("Choose Category"),
      isExpanded: true,
      value: choosevalue,
      onChanged: (newValue) {
        setState(() {
          choosevalue = newValue.toString();
        });
      },
      items: listItem.map((valueItem) {
        return DropdownMenuItem(
          value: valueItem,
          child: Text(valueItem),
        );
      }).toList(),
    );
  }

  Widget _buildmrp() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(labelText: 'Food MRP'),
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^\d{0,8}(\.\d{1,4})?$').hasMatch(value)) {
          return 'Enter Food MRP';
        }
        return null;
      },
      onSaved: (value) {
        _mrp = value;
      },
    );
  }

  Widget _buildprice() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      enabled: true,
      decoration: const InputDecoration(labelText: 'Offer price'),
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^\d{0,8}(\.\d{1,4})?$').hasMatch(value)) {
          return 'offer is Required';
        }

        return null;
      },
      onSaved: (value) {
        _offer = value;
      },
    );
  }

  Widget _buildproductqtn() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(labelText: 'Product qtn'),
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^\d+(\.\d{1,3})?\s*(gm|kg)$').hasMatch(value)) {
          return ' product qtn';
        }

        return null;
      },
      onSaved: (value) {
        _productqtn = value;
      },
    );
  }

  Widget _buildpiece() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      enabled: true,
      decoration: const InputDecoration(labelText: 'piece'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
          return 'piece';
        }

        return null;
      },
      onSaved: (value) {
        _food = value;
      },
    );
  }

  Widget _builddate() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      enabled: true,
      decoration: const InputDecoration(labelText: 'date and time of expiry'),
      // validator: (value) {
      //   if (value!.isEmpty||!RegExp(r'^(\d{4}-?\d\d-?\d\d(\s|T)\d\d:?\d\d:?\d\d)').hasMatch(value)) {
      //     return 'date and time ';
      //   }

      //   return null;
      // },
      onSaved: (value) {
        _date = value;
      },
    );
  }

  Widget _builddescription() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      enabled: true,
      decoration: const InputDecoration(labelText: 'Description'),
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
          return 'Description';
        }
        return null;
      },
      onSaved: (value) {
        _description = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            _pickedImage == null
                ? Center(
                    child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Card(
                        elevation: 4,
                        child: RawMaterialButton(
                          child: Icon(Icons.camera_alt_rounded),
                          onPressed: () {
                            alertBox(context: context);
                          },
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: InkWell(
                      onTap: () {
                        alertBox(context: context);
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: FileImage(_pickedImage!),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildbrand(),
                        _buildfood(),
                        dropButton
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Enter category",
                                  style: TextStyle(color: Colors.red[700]),
                                ))
                            : const SizedBox(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: _buildmrp()),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 2.2,
                                child: _buildprice()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: _buildproductqtn(),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.2,
                              child: _buildpiece(),
                            ),
                          ],
                        ),
                        _builddate(),
                        _builddescription(),
                        const SizedBox(height: 30),
                        mainButton(
                            buttonText: "Add Product",
                            context: context,
                            onpress: () {
                              _UploadProduct();
                            })
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  Future<void> _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _pickedImage = pickedImageFile;
    });
  }

  alertBox({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Choose option",
            style: TextStyle(fontWeight: FontWeight.w100, color: Colors.black),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                InkWell(
                  onTap: _pickImageCamera,
                  splashColor: Colors.black,
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.camera,
                          color: Colors.purpleAccent,
                        ),
                      ),
                      Text(
                        "Camera",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: _pickImageGallery,
                  splashColor: Colors.black,
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.image,
                          color: Colors.purpleAccent,
                        ),
                      ),
                      Text(
                        "Gallery",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w100,
                            color: Colors.black),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
