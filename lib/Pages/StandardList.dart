import 'package:cards/Helper/Global.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:cards/Widgets/Standard_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StandardList extends StatelessWidget {
  final List<Standard>? standards;
  final AnimationController? animationController;
  const StandardList({this.standards, this.animationController});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(left: 35, right: 35, top: 35),
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 2,
      itemCount: standards!.length,
      itemBuilder: (BuildContext context, int index) {
        final int count = standards!.length > 3 ? 3 : standards!.length;
        final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
                parent: animationController!,
                curve: Interval((1 / count) * index, 1.0,
                    curve: Curves.fastOutSlowIn)));
        animationController?.forward();
        Standard Std = new Standard(
          title: standards![index].title,
          price: standards![index].price,
          image: standards![index].image,
        );
        return StandardCard(
          standard: Std,
          animation: animation,
          index: index,
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.count(
          index == 2
              ? 3
              : index == 1
                  ? 2
                  : 1,
          index == 0
              ? 1.4
              : index == 1
                  ? 1.5
                  : 0.7),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
    );
  }
}
