import 'package:flutter/material.dart';
import 'package:moms_register/model.dart';
import 'package:http/http.dart' as http;

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
      home: Scaffold(
        appBar: AppBar(),
        body: RegisterPage(),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

Future<UserData?> submitData(
  
  String name,
  String brand_name,
  String address,
  String pin,
  String dob,
  String phone_number,
  String ifsc_code,
  String pan_id,
  String b_acc_no,
  String fssai_id,
  String lat,
  String longs,
  String acc_holder_name,

  // String photo,
  // String profilePhoto,
  // String fssaiPhoto,
  // String panPhoto,
  // String bankPhoto
) async {
  var response = await http
      .post(Uri.parse("http://192.168.0.138:8002/api/createmom"), body: {
    "name": name,
    "brand_name": brand_name,
    "address": address,
    "pin": pin,
    "dob": dob,
    "phone_number": phone_number,
    "ifsc_code": ifsc_code,
    "pan_id": pan_id,
    "b_acc_no": b_acc_no,
    "fssai_id": fssai_id,
    "lat": lat,
    "longs": longs,
    "acc_holder_name": acc_holder_name,
  });

  var data = response.body;
  print(data);

  if (response == "mom record created") {
    String responseString = response.body;
    userDataFromJson(responseString);
  } else {
    return null;
  }
}

class _RegisterPageState extends State<RegisterPage> {
  UserData? _userData;

  TextEditingController nameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController panIdController = TextEditingController();
  TextEditingController bankAccController = TextEditingController();
  TextEditingController fssaiIdnumberController = TextEditingController();
  TextEditingController latController = TextEditingController();
  TextEditingController longController = TextEditingController();
  TextEditingController accHolderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'name'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: brandController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'brand name'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Address'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: pinController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'pin number'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: dobController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'dob'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: phonenumberController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Phone Number'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: ifscCodeController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'ifsc'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: panIdController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'pan id'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: bankAccController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'bank account'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: fssaiIdnumberController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'fassai number'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: latController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'lat number'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: latController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'long number'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: longController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'lat number'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: accHolderController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Account holder name'),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    primary: Colors.blue),
                onPressed: () async {
                  String name = nameController.text;
                  String brand_name = brandController.text;
                  String address = brandController.text;
                  String pin = pinController.text;
                  String dob = dobController.text;
                  String phone_number = phonenumberController.text;
                  String ifsc_code = ifscCodeController.text;
                  String pan_id = panIdController.text;
                  String b_acc_no = bankAccController.text;
                  String fssai_id = fssaiIdnumberController.text;
                  String lat = latController.text;
                  String longs = longController.text;
                  String acc_holder_name = accHolderController.text;

                  UserData? user = await submitData(
                      name,
                      brand_name,
                      address,
                      pin,
                      dob,
                      phone_number,
                      ifsc_code,
                      pan_id,
                      b_acc_no,
                      fssai_id,
                      lat,
                      longs,
                      acc_holder_name);
                },
                child: const Text("Save Address"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
