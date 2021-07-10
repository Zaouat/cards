import 'dart:convert';
import 'package:cards/Helper/Global.dart';
import 'package:cards/Pages/AsGbList.dart';
import 'package:cards/Pages/Buttons.dart';
import 'package:cards/Pages/SimpleList.dart';
import 'package:cards/Pages/StandardList.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:cards/Widgets/Title_Description.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Simples> simples = [];
  List<Standard> standards = [];
  List<AsGb> asgb= [];
  List<Buttons> buttons= [];
  AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Cst.lightBG,

      body: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icons/info.svg',
                      color: Cst.primaryColor,
                      width: 22,
                    ),
                    tooltip: "about",
                    onPressed: () {

                    },
                    color: Cst.softColor.withOpacity(0.9)),
              ),
            ),
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
            StandardList(standards: standards, animationController: animationController),
            //------------Photo as BG Cards
            TitleDesc(
                title: "Photo as BG",
                des: "You can also use photo as backgrounds for a more immersive experience."),
            AsGbList(asGb: asgb, animationController: animationController),
            //------------Photo with Buttons
            TitleDesc(
                title: "Buttons",
                des: "In certain scenarios, using buttons on cards can improve the UX."),
            ButtonsList(buttons: buttons, animationController: animationController),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  // Fetch content from the Buttons json file
  Future<void> readJsonButtons() async {
    final String response =
    await rootBundle.loadString('assets/data/Buttons.json');
    final data = await json.decode(response);
    setState(() {
      final List<dynamic> _items = data["buttons"];
      buttons = _items.map((item) => Buttons.fromMap(item)).toList();
    });
  }
  // Fetch content from the GB json file
  Future<void> readJsonAsGb() async {
    final String response =
    await rootBundle.loadString('assets/data/AsBG.json');
    final data = await json.decode(response);
    setState(() {
      final List<dynamic> _items = data["asBg"];
      asgb = _items.map((item) => AsGb.fromMap(item)).toList();
    });
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
  }
  // Fetch content from the Standard json file
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
    readJsonButtons();
    readJsonAsGb();
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
