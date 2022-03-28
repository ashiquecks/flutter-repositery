import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

//font size
const double h1 = 18;
const double h2 = 16;
const double h3 = 14;
const double para = 12;
const double h1x2 = 30;

const double modelTitlesF = 42; //light {modal title}
const double pageTitles = 34; //bold {page title}
const double title1F = 28; //medium {Tabs,titles,forms}
const double title2F = 22; //medium {Buttons,tabs,titles,forms}
const double headLineF = 20; //regular {info paragraph}
const double bodySectionF = 14; //regular {section description}
const double captiponF = 12; //regular {Time Stamps,footers}

//colors
const Color col1 = Color(0xFF277DC3);
const Color col12 = Color(0x42277DC3);
const Color col2 = Color(0xff52C5D8);
const Color col3 = Color(0xff262F6A);
const Color col4 = Color(0xff9297B4);
const Color col5 = Color(0xffF6F6F6);
const Color col6 = Color(0xff008000);
const Color col7 = Color(0xffEF4255);
const Color col8 = Color(0xffEE7526);
const Color col9 = Color(0xffEFC519);
const Color col10 = Color(0xffffffff);
const Color col11 = Color(0x00FFFFFF);
const Color col13 = Color(0xFFF0F0F0);

//image section
const String orderSectionImg = "assets/images/otp_sreen_img.png";
const String otpVerifyImg = "assets/images/otp_verify.png";
const String splashScreenImg = "assets/images/succesfull.png";
const String momsLogo = "assets/images/splash_logo.png";
const String noInternet = "assets/images/no_internet.png";

//font famly
const String ralewayFont = "Raleway";
const String androidFont = "Roboto";

Widget orderedProductView(
    {required BuildContext context,
    required String prdName,
    required int itemNo,
    required int price,
    required String dueDate,
    required String status,
    required String orderDate,
    required String cusNam,
    required String ordAdd,
    required String cusPhon,
    required String ordTime,
    required image,
    required VoidCallback onpressed}) {
  return GestureDetector(
    onTap: onpressed,
    child: Container(
      // decoration: BoxDecoration(),
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      margin: const EdgeInsets.only(left: 10, right: 5, top: 10, bottom: 5),
      width: MediaQuery.of(context).size.width - 20,
      decoration: BoxDecoration(
          color: col10,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 3),
                color: col12,
                blurRadius: 6,
                spreadRadius: 2)
          ]),

      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(5), topRight: Radius.circular(5)),
            child: Image(
              image: AssetImage(image == null ? orderSectionImg : image),
              height: 100,
              width: MediaQuery.of(context).size.width / 2.8,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Container(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  prdName,
                  style: const TextStyle(
                      fontFamily: ralewayFont,
                      fontWeight: FontWeight.w500,
                      fontSize: h2,
                      color: col3),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Item no : $itemNo",
                      style: const TextStyle(
                          fontFamily: ralewayFont,
                          fontWeight: FontWeight.w500,
                          fontSize: h3,
                          color: col3),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text("Price : $price /-",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontFamily: ralewayFont,
                                  fontWeight: FontWeight.w500,
                                  fontSize: h3,
                                  color: col3)),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(dueDate,
                    style: const TextStyle(
                        fontFamily: ralewayFont,
                        fontWeight: FontWeight.w500,
                        fontSize: h3,
                        color: col3)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: status == "pending"
                                  ? col9
                                  : status == "accepted"
                                      ? col6
                                      : col7),
                          margin: const EdgeInsets.only(right: 5),
                        ),
                        Text(status,
                            style: const TextStyle(
                                fontFamily: ralewayFont,
                                fontWeight: FontWeight.w500,
                                fontSize: para,
                                color: col3)),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Text(orderDate,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontFamily: ralewayFont,
                                  fontWeight: FontWeight.w500,
                                  fontSize: para,
                                  color: col3)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    ),
  );
}
