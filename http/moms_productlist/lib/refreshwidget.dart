// ignore: file_names
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RefreshWidge extends StatefulWidget {
final Widget child;
final GlobalKey<RefreshIndicatorState> keyRefresh;
final Future Function() onRefresh;
  const RefreshWidge({Key? key, required this.child, required this.onRefresh,required this.keyRefresh}) : super(key: key);

  @override
  _RefreshWidgeState createState() => _RefreshWidgeState();
}

class _RefreshWidgeState extends State<RefreshWidge> {
  @override
  Widget build(BuildContext context) =>Platform.isIOS? buildIOSlist():buildAndroidList();
  Widget buildAndroidList() => RefreshIndicator(
    
    key: widget.keyRefresh,
    onRefresh:widget.onRefresh,child: widget.child);

  Widget buildIOSlist()=> CustomScrollView(physics: const BouncingScrollPhysics(),slivers: [
    CupertinoSliverRefreshControl(
      onRefresh: widget.onRefresh,
    ),
    SliverToBoxAdapter(child: widget.child,)
  ],);
}