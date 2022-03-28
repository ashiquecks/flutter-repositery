import 'package:flutter/material.dart';

class ImageInkwell extends StatelessWidget {
  const ImageInkwell({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: Navigator.push(context, MaterialPageRoute(builder: builder)),
          child: Image.network("https://static.toiimg.com/photo/msid-82160344/82160344.jpg?42892"),
        ),
      ),
    );
  }
}

