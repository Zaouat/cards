import 'dart:convert';
import 'package:cards/Helper/Global.dart';
import 'package:cards/Pages/AsGbList.dart';
import 'package:cards/Pages/Buttons.dart';
import 'package:cards/Pages/SimpleList.dart';
import 'package:cards/Pages/StandardList.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:cards/Widgets/Title_Description.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: ()async{
                      await canLaunch("https://github.com/devllopa")
                          ? await launch("https://github.com/devllopa")
                          : throw 'Could not launch this Url';

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.5,
                        decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                          color: Cst.primaryColor.withOpacity(0.1),

                        ),
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Created by ",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  color: Cst.colorTxt,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal)),
                          Text("DEVLOPA.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(
                                  color: Cst.primaryColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.normal)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
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
        duration: const Duration(milliseconds: 3500), vsync: this);
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
