// To parse this JSON data, do
//
//     final profileData = profileDataFromJson(jsonString);

import 'dart:convert';

List<ProfileData> profileDataFromJson(String str) => List<ProfileData>.from(
    json.decode(str).map((x) => ProfileData.fromJson(x)));

String profileDataToJson(List<ProfileData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfileData {
  ProfileData({
    required this.mId,
    required this.name,
    required this.brandName,
    required this.address,
    required this.pin,
    required this.phoneNumber,
    required this.ifscCode,
    required this.photo,
    required this.panId,
    required this.bAccNo,
    required this.fssaiId,
    required this.fssaiPhoto,
    required this.panPhoto,
    required this.lat,
    required this.longs,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.accHolderName,
    required this.bankPassPhoto,
    required this.dob,
  });

  int mId;
  String name;
  String brandName;
  String address;
  String pin;
  String phoneNumber;
  String ifscCode;
  String photo;
  String panId;
  String bAccNo;
  String fssaiId;
  String fssaiPhoto;
  String panPhoto;
  String lat;
  String longs;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String accHolderName;
  String bankPassPhoto;
  String dob;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        mId: json["m_id"],
        name: json["name"],
        brandName: json["brand_name"],
        address: json["address"],
        pin: json["pin"],
        phoneNumber: json["phone_number"],
        ifscCode: json["ifsc_code"],
        photo: json["photo"],
        panId: json["pan_id"],
        bAccNo: json["b_acc_no"],
        fssaiId: json["fssai_id"],
        fssaiPhoto: json["fssai_photo"],
        panPhoto: json["pan_photo"],
        lat: json["lat"],
        longs: json["longs"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        accHolderName: json["acc_holder_name"],
        bankPassPhoto: json["bank_pass_photo"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "m_id": mId,
        "name": name,
        "brand_name": brandName,
        "address": address,
        "pin": pin,
        "phone_number": phoneNumber,
        "ifsc_code": ifscCode,
        "photo": photo,
        "pan_id": panId,
        "b_acc_no": bAccNo,
        "fssai_id": fssaiId,
        "fssai_photo": fssaiPhoto,
        "pan_photo": panPhoto,
        "lat": lat,
        "longs": longs,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "acc_holder_name": accHolderName,
        "bank_pass_photo": bankPassPhoto,
        "dob": dob,
      };
}
