import 'dart:convert';

import 'package:cards/Helper/Global.dart';
import 'package:cards/Pages/SimpleList.dart';
import 'package:cards/Pages/StandardList.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:cards/Widgets/Title_Description.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Simples> simples = [];
  List<Standard> standards = [];
  AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cst.lightBG,
      body: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 30),
            //-------------Simple Cards
            TitleDesc(
                title: "Simple",
                des:
                    "These ideas are great when you need simple cards without photos."),
            SimpelsList(
                simples: simples, animationController: animationController),
            //------------Standard Cards
            TitleDesc(
                title: "Standard",
                des:
                    "These popular ideas are useful when you need to use photos."),
            StandardList(standards: standards, animationController: animationController)
          ],
        ),
      ),
    );
  }

  // Fetch content from the Simples json file
  Future<void> readJsonSimples() async {
    final String response =
        await rootBundle.loadString('assets/data/Simple.json');
    final data = await json.decode(response);
    setState(() {
      final List<dynamic> _items = data["simples"];
      simples = _items.map((item) => Simples.fromMap(item)).toList();
    });
  } // Fetch content from the Simples json file

  Future<void> readJsonStandard() async {
    final String response =
        await rootBundle.loadString('assets/data/Standard.json');
    final data = await json.decode(response);
    setState(() {
      final List<dynamic> _items = data["standard"];
      standards = _items.map((item) => Standard.fromMap(item)).toList();
    });
  }

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    readJsonStandard();
    readJsonSimples();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }
}
