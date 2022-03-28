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
  void _UploadFile() async {
    String name = basename(nameController.text);
    String brand_name = basename(brandController.text);
    String address = basename(addressController.text);
    String pin = basename(pinController.text);
    String dob = basename(dobController.text);
    String phone_number = basename(phonenumberController.text);
    String ifsc_code = basename(ifscCodeController.text);
    String pan_id = basename(panIdController.text);
    String b_acc_no = basename(bankAccController.text);
    String fssai_id = basename(fssaiIdnumberController.text);
    String lat = basename(latController.text);
    String longs = basename(longController.text);
    String acc_holder_name = basename(accHolderController.text);

    String photos = basename(files!.path);
    String profilePhotos = basename(files1!.path);
    String fssaiPhotos = basename(files2!.path);
    String panPhotos = basename(files3!.path);
    String bankPhotos = basename(file4!.path);

    try {
      FormData formData = FormData.fromMap({
        "name": name.toString(),
        "brand_name": brand_name.toString(),
        "address": address.toString(),
        "pin": pin.toString(),
        "dob": dob.toString(),
        "phone_number": phone_number.toString(),
        "ifsc_code": ifsc_code.toString(),
        "pan_id": pan_id.toString(),
        "b_acc_no": b_acc_no.toString(),
        "fssai_id": fssai_id.toString(),
        "lat": lat.toString(),
        "longs": longs.toString(),
        "acc_holder_name": acc_holder_name.toString(),
        "photo": await MultipartFile.fromFile(files!.path, filename: photos),
        "profilePhoto":
            await MultipartFile.fromFile(files1!.path, filename: profilePhotos),
        "fssaiPhoto":
            await MultipartFile.fromFile(files2!.path, filename: fssaiPhotos),
        "panPhoto":
            await MultipartFile.fromFile(files3!.path, filename: panPhotos),
        "bankPhoto":
            await MultipartFile.fromFile(file4!.path, filename: bankPhotos),
      });

      Response response = await Dio()
          .post("http://192.168.0.138:8002/api/createmom", data: formData);

      var data = response.data;
      print(data);

      if (response == "mom record created") {
        String responseString = response.data;
        userDataFromJson(responseString);
      } else {
        return null;
      }

      print("File Upload response: $response");
    } catch (e) {}
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
                    controller: longController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'long number'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: accHolderController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'holder name'),
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
                        _UploadFile();
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
