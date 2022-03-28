import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: NewsScreen(),
  ));
}

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final List<NewsDetail> items = [];

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "Latest News",
          style: Styles.navBarTitle,
        )),
        body: ListView.builder(
            itemCount: this.items.length, itemBuilder: _listViewItemBuilder));
  }

  

  void getNews() async {
    final http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=d2eccaadb59e4fa0b3275a828607f722"));
    final Map<String, dynamic> responseData = json.decode(response.body);
    responseData['articles'].forEach((newsDetail) {
      final NewsDetail news = NewsDetail(
          description: newsDetail['description'],
          title: newsDetail['title'],
          url: newsDetail['urlToImage']);
      setState(() {
        items.add(news);
      });
    });
  }

  Widget _listViewItemBuilder(BuildContext context, int index) {
    var newsDetail = this.items[index];
    return ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: _itemThumbnail(newsDetail),
      title: _itemTitle(newsDetail),
    );
  }

  _itemThumbnail(NewsDetail newsDetail) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 100.0),
      child: newsDetail.url == null
          ? null
          : Image.network(newsDetail.url, fit: BoxFit.fitWidth),
    );
  }

  _itemTitle(NewsDetail newsDetail) {
    return Text(newsDetail.title, style: Styles.textDefault);
  }
}

class NewsDetail {
  final String title;
  final String description;
  final String url;
  NewsDetail(
      {required this.title, required this.url, required this.description});
}

class Styles {
  static const _textSizeLarge = 25.0;
  static const _textSizeDefault = 16.0;
  static final Color _textColorStrong = Colors.black;
  static final Color _textColorDefault = Colors.black;
  static final String fontNameDefault = 'Muli';
  static final navBarTitle = TextStyle(
    fontFamily: fontNameDefault,
  );
  static final headerLarge = TextStyle(
      fontFamily: fontNameDefault,
      fontSize: _textSizeLarge,
      color: _textColorStrong);
  static final textDefault = TextStyle(
      fontFamily: fontNameDefault,
      fontSize: _textSizeDefault,
      color: _textColorDefault);
}
