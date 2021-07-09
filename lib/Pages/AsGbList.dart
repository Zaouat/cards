import 'package:cards/Helper/Global.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:cards/Widgets/AsGb_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AsGbList extends StatelessWidget {
  final List<AsGb>? asGb;
  final AnimationController? animationController;
  const AsGbList({this.asGb, this.animationController});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(left: 35, right: 35, top: 35),
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 2,
      itemCount: asGb!.length,
      itemBuilder: (BuildContext context, int index) {
        final int count = asGb!.length > 3 ? 3 : asGb!.length;
        final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
            parent: animationController!,
            curve: Interval((1 / count) * index, 1.0,
                curve: Curves.fastOutSlowIn)));
        animationController?.forward();
        AsGb Asgb = new AsGb(
          title: asGb![index].title,
          count: asGb![index].count,
          image: asGb![index].image,
        );
        return AsGbCard(
          asgb: Asgb,
          animation: animation,
          index: index,
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.count(
          index == 0
              ? 1
              : index == 1
              ? 1
              : 2,
          index == 0
              ? 1.5
              : index == 1
              ? 1.5
              : 1),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
    );
  }
}
