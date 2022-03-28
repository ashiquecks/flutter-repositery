import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mutipart_fileuplad/const.dart';
import 'package:mutipart_fileuplad/model.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
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
      home: const UploadDocumentScreen(),
    );
  }
}

class UploadDocumentScreen extends StatefulWidget {
  const UploadDocumentScreen({Key? key}) : super(key: key);

  @override
  _UploadDocumentScreenState createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
// final ImagePicker _picker = ImagePicker();

  var baseUrl = "http://192.168.0.131:8002";

  var createMom = "/api/createmom";

  void _UploadFile(
    // filepath
    // String name,
    // String brand_name,
    // String address,
    // String pin,
    // String dob,
    // String phone_number,
    // String ifsc_code,
    // String pan_id,
    // String b_acc_no,
    // String fssai_id,
    // String lat,
    // String longs,
    // String acc_holder_name,

    File photo,
    File profilePhoto,
    File fssaiPhoto,
    File panPhoto,
    File bankPhoto,
  ) async {
    String photos = basename(photo.path);
    String profilePhotos = basename(profilePhoto.path);
    String fssaiPhotos = basename(fssaiPhoto.path);
    String panPhotos = basename(panPhoto.path);
    String bankPhotos = basename(bankPhoto.path);

    try {
      FormData formData = FormData.fromMap({
        // "name": "ashik",
        // "age": "22",
        "name": "ajaml",
        "brand_name": "afc",
        "address": "kuttyadi",
        "pin": "86969",
        "dob": "12/04/1997",
        "phone_number": "7588587787",
        "ifsc_code": "564659454",
        "pan_id": "36593525892",
        "b_acc_no": "8520233233",
        "fssai_id": "32853205323",
        "lat": "8250525202",
        "longs": "502022025305",
        "acc_holder_name": "arjun",

        "photo": await MultipartFile.fromFile(photo.path, filename: photos),
        "profilePhoto": await MultipartFile.fromFile(profilePhoto.path,
            filename: profilePhotos),
        "fssaiPhoto": await MultipartFile.fromFile(fssaiPhoto.path,
            filename: fssaiPhotos),
        "panPhoto":
            await MultipartFile.fromFile(panPhoto.path, filename: panPhotos),
        "bankPhoto":
            await MultipartFile.fromFile(bankPhoto.path, filename: bankPhotos),
      });

      Response response = await Dio().post(baseUrl + createMom, data: formData);

      var data = response.data;
      print(data);

      print("File Upload response: $response");
    } catch (e) {}
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
    File photo,
    File profilePhoto,
    File fssaiPhoto,
    File panPhoto,
    File bankPhoto,
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
      "photo": photo,
      "profilePhoto": profilePhoto,
      "fssaiPhoto": fssaiPhoto,
      "panPhoto": panPhoto,
      "bankPhoto": bankPhoto,
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

  File? files, files1, files2, files3, file4;

  void openFile(PlatformFile file) async {
    OpenFile.open(file.path);
  }

  void openFil(File? file) async {
    OpenFile.open(file?.path);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  void getImageFile(int indexNum) async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    final file = result.files.first;

    final newFile = await saveFilePermanently(file);
    setState(() {
      indexNum == 0
          ? files = newFile
          : indexNum == 1
              ? files1 = newFile
              : indexNum == 2
                  ? files2 = newFile
                  : indexNum == 3
                      ? files3 = newFile
                      : file4 = newFile;
    });
    openFil(newFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Center(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
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
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                files == null
                                    ? getImageFile(0)
                                    : openFil(files);
                                // print(files.toString());
                              },
                              child: Card(
                                child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: files == null
                                        ? const Icon(
                                            Icons.file_upload_outlined,
                                            color: col3,
                                            size: 40,
                                          )
                                        : const Icon(
                                            Icons.file_download_done_outlined,
                                            color: Colors.green,
                                            size: 40,
                                          )),
                              ),
                            ),
                            TextButton(
                              child: const Text(
                                "Fssai",
                                style: TextStyle(
                                    color: col3,
                                    fontFamily: androidFont,
                                    fontSize: para),
                              ),
                              onPressed: () {
                                getImageFile(0);
                              },
                            ),
                            IconButton(
                                onPressed: () {
                                  getImageFile(0);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: col3,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                files1 == null
                                    ? getImageFile(1)
                                    : openFil(files1);
                              },
                              child: Card(
                                child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: files1 == null
                                        ? const Icon(
                                            Icons.file_upload_outlined,
                                            color: col3,
                                            size: 40,
                                          )
                                        : const Icon(
                                            Icons.file_download_done_outlined,
                                            color: Colors.green,
                                            size: 40,
                                          )),
                              ),
                            ),
                            const Text(
                              'Pan card',
                              style: TextStyle(
                                  color: col3,
                                  fontFamily: androidFont,
                                  fontSize: para),
                            ),
                            IconButton(
                                onPressed: () {
                                  getImageFile(1);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: col3,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                files2 == null
                                    ? getImageFile(2)
                                    : openFil(files2);
                              },
                              child: Card(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: files2 == null
                                      ? const Icon(
                                          Icons.file_upload_outlined,
                                          color: col3,
                                          size: 40,
                                        )
                                      : const Icon(
                                          Icons.file_download_done_outlined,
                                          color: Colors.green,
                                          size: 40,
                                        ),
                                ),
                              ),
                            ),
                            const Text(
                              'Bank passbook',
                              style: TextStyle(
                                  color: col3,
                                  fontFamily: androidFont,
                                  fontSize: para),
                            ),
                            IconButton(
                                onPressed: () {
                                  getImageFile(2);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: col3,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                files3 == null
                                    ? getImageFile(3)
                                    : openFil(files3);
                              },
                              child: Card(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: files3 == null
                                      ? const Icon(
                                          Icons.file_upload_outlined,
                                          color: col3,
                                          size: 40,
                                        )
                                      : const Icon(
                                          Icons.file_download_done_outlined,
                                          color: Colors.green,
                                          size: 40,
                                        ),
                                ),
                              ),
                            ),
                            const Text(
                              'store logo',
                              style: TextStyle(
                                  color: col3,
                                  fontFamily: androidFont,
                                  fontSize: para),
                            ),
                            IconButton(
                                onPressed: () {
                                  getImageFile(3);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: col3,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                file4 == null
                                    ? getImageFile(4)
                                    : openFil(file4);
                              },
                              child: Card(
                                child: SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: file4 == null
                                      ? const Icon(
                                          Icons.file_upload_outlined,
                                          color: col3,
                                          size: 40,
                                        )
                                      : const Icon(
                                          Icons.file_download_done_outlined,
                                          color: Colors.green,
                                          size: 40,
                                        ),
                                ),
                              ),
                            ),
                            const Text(
                              'profle pick',
                              style: TextStyle(
                                  color: col3,
                                  fontFamily: androidFont,
                                  fontSize: para),
                            ),
                            IconButton(
                                onPressed: () {
                                  getImageFile(4);
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: col3,
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  mainButton(
                    buttonText: "Next",
                    context: context,
                    onpress: () async {
                      if (files != null &&
                          files1 != null &&
                          files2 != null &&
                          files3 != null &&
                          file4 != null) {
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

                        _UploadFile(files!, files1!, files2!, files3!, file4!);

                        // UserData? user = await submitData(
                        //     name,
                        //     brand_name,
                        //     address,
                        //     pin,
                        //     dob,
                        //     phone_number,
                        //     ifsc_code,
                        //     pan_id,
                        //     b_acc_no,
                        //     fssai_id,
                        //     lat,
                        //     longs,
                        //     acc_holder_name
                        //     files!,
                        //     files1!,
                        //     files2!,
                        //     files3!,
                        //     file4!
                        //     );

                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            "exeption",
                            style: TextStyle(color: Colors.red),
                          ),
                        ));
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
