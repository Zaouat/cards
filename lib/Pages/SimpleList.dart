import 'package:cards/Helper/Global.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:flutter/material.dart';

class SimpelsList extends StatelessWidget {
  final List<Simples>? simples;
  const SimpelsList({this.simples});

  @override
  Widget build(BuildContext context) {

    return LiveGrid.options(
      padding: EdgeInsets.all(30),
      options: Cst.options,
      shrinkWrap: true,
      primary: false,
      itemBuilder: (BuildContext context, int index, Animation<double> animation) {
        Simples Simple = new Simples(
          title: simples![index].title,
          icon: simples![index].icon,
          count: simples![index].count,
        );
       return Expanded(
         child: SimpleCard(
            simple: Simple,
            animation: animation,
            index: index,
          ),
       );
      },
      itemCount: simples!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
    );
  }
}
