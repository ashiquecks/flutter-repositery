import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class StaggredShimmer extends StatefulWidget {
  const StaggredShimmer({Key? key}) : super(key: key);

  @override
  _StaggredShimmerState createState() => _StaggredShimmerState();
}

class _StaggredShimmerState extends State<StaggredShimmer> {
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
  // ignore: use_key_in_widget_constructors
  const BackGroundTile({required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        period: const Duration(seconds: 3),
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Card(
          color: backgroundColor,
        ));
  }
}

List<StaggeredTile> _cardTile = <StaggeredTile>[
  const StaggeredTile.count(2, 3),
  const StaggeredTile.count(2, 2.5),
  const StaggeredTile.count(2, 2.5),
  const StaggeredTile.count(2, 3),
  const StaggeredTile.count(2, 2.5),
  const StaggeredTile.count(2, 3),
];

List<Widget> _listTile = <Widget>[
  const BackGroundTile(
    backgroundColor: Colors.black,
  ),
  const BackGroundTile(
    backgroundColor: Colors.black,
  ),
  const BackGroundTile(
    backgroundColor: Colors.black,
  ),
  const BackGroundTile(
    backgroundColor: Colors.black,
  ),
  const BackGroundTile(
    backgroundColor: Colors.black,
  ),
  const BackGroundTile(
    backgroundColor: Colors.black,
  ),
];
