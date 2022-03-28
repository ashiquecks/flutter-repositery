import 'package:flutter/material.dart';

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

const String ralewayFont = "Raleway";
const String androidFont = "Roboto";

Widget mainButton({
  required String buttonText,
  required BuildContext context,
  required VoidCallback onpress,
}) {
  return GestureDetector(
    child: Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [col1, col2]),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(
              color: col12,
              blurRadius: 8,
              offset: Offset(0, 5),
              spreadRadius: 1,
            )
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          splashColor: col2,
          highlightColor: col1,
          onTap: onpress,
          child: Container(
            alignment: Alignment.center,
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            width: MediaQuery.of(context).size.width - 20,
            child: Text(
              buttonText.toUpperCase(),
              style: const TextStyle(
                  letterSpacing: 1,
                  fontSize: 16,
                  fontFamily: ralewayFont,
                  fontWeight: FontWeight.bold,
                  color: col10),
            ),
          ),
        ),
      ),
    ),
  );
}
