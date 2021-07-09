import 'dart:convert';

import 'package:cards/Helper/Global.dart';
import 'package:cards/Pages/SimpleList.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  List<Simples> simples = [];
  // Fetch content from the json file
  Future<void> readJsonSimples() async {
    final String response =
        await rootBundle.loadString('assets/data/Simple.json');
    final data = await json.decode(response);
    setState(() {
      final List<dynamic> _items = data["simples"];
      simples = _items.map((item) => Simples.fromMap(item)).toList();
    });
  }
  @override
  void initState() {
    readJsonSimples();
    super.initState();
  }

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
            Padding(
              padding: EdgeInsets.all(25),
              child: Text("Simple",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Cst.colorTxt,
                      fontSize: 40,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.normal)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 45),
              child: SelectableText(
                  "These ideas are great when you need simple cards without photos.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      color: Cst.colorTxt,
                      fontSize: 15,
                      height: 1.5,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal)),
            ),
            SimpelsList(simples: simples),

          ],
        ),
      ),
    );
  }
}
