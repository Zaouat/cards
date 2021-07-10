import 'package:cards/Helper/Global.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:cards/Widgets/Button_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ButtonsList extends StatelessWidget {
  final List<Buttons>? buttons;
  final AnimationController? animationController;
  const ButtonsList({this.buttons, this.animationController});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.only(left: 35, right: 35, top: 35),
      shrinkWrap: true,
      primary: false,
      crossAxisCount: 2,
      itemCount: buttons!.length,
      itemBuilder: (BuildContext context, int index) {
        final int count = buttons!.length > 3 ? 3 : buttons!.length;
        final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
            parent: animationController!,
            curve: Interval((1 / count) * index, 1.0,
                curve: Curves.fastOutSlowIn)));
        animationController?.forward();
        Buttons button = new Buttons(
          title: buttons![index].title,
          image: buttons![index].image,
          count: buttons![index].count,
        );
        return ButtonCard(
          button: button,
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
              ? 1.55
              : index == 1
              ? 1.4
              : 0.85),
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
    );
  }
}
