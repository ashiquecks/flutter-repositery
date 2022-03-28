import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class StagrredShimmer extends StatefulWidget {
  const StagrredShimmer({Key? key}) : super(key: key);

  @override
  _StagrredShimmerState createState() => _StagrredShimmerState();
}

class _StagrredShimmerState extends State<StagrredShimmer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: _cardTile,
          children: _listTile,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}

class BackGroundTile extends StatelessWidget {
  final Color backgroundColor;
  final IconData icondata;

  // ignore: use_key_in_widget_constructors
  const BackGroundTile({required this.backgroundColor, required this.icondata});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        period: const Duration(seconds: 3),
        baseColor: Colors.grey,
        highlightColor: Colors.black,
        child: Card(
          color: backgroundColor,
          child: Icon(icondata, color: Colors.white),
        ));
  }
}

List<StaggeredTile> _cardTile = <StaggeredTile>[
  const StaggeredTile.count(2, 3),
  const StaggeredTile.count(2, 2.5),
  const StaggeredTile.count(2, 2.5),
  const StaggeredTile.count(2, 3),
  const StaggeredTile.count(2, 2.5),
];

List<Widget> _listTile = <Widget>[
  const BackGroundTile(backgroundColor: Colors.red, icondata: Icons.home),
  const BackGroundTile(backgroundColor: Colors.red, icondata: Icons.home),
  const BackGroundTile(backgroundColor: Colors.orange, icondata: Icons.ac_unit),
  const BackGroundTile(
      backgroundColor: Colors.yellowAccent, icondata: Icons.adjust_rounded),
  const BackGroundTile(
      backgroundColor: Colors.deepOrange, icondata: Icons.attach_money),
];
