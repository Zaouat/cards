import 'package:cards/Helper/Global.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SimpelsList extends StatelessWidget {
  final List<Simples>? simples;
  final AnimationController? animationController;
  const SimpelsList({this.simples, this.animationController});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(left: 35,right: 35,top: 35),
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 2,
      itemCount: simples!.length,
      itemBuilder: (BuildContext context, int index) {
        final int count = simples!.length > 3 ? 3 : simples!.length;
        final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
                parent: animationController!,
                curve: Interval((1 / count) * index, 1.0,
                    curve: Curves.fastOutSlowIn)));
        animationController?.forward();
        Simples Simple = new Simples(
          title: simples![index].title,
          icon: simples![index].icon,
          count: simples![index].count,
        );
        return SimpleCard(
          simple: Simple,
          animation: animation,
          index: index,
        );
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.count(
          index == 2 ? 3 : 1,
          index == 0
              ? 1.3
              : index == 1
                  ? 1.3
                  : 0.7),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
    );
  }
}
