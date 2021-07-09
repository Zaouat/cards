import 'dart:ui';

import 'package:cards/Helper/Global.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class StandardCard extends StatelessWidget {
  final Standard? standard;
  final Animation<double>? animation;
  final int? index;

  const StandardCard({this.standard, this.animation, this.index});
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(animation!),
        // And slide transition
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -0.1),
            end: Offset.zero,
          ).animate(animation!),
          child: Container(
            decoration: BoxDecoration(
                color: Cst.lightColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                      color: Cst.darkBG.withOpacity(0.02),
                      blurRadius: 12.0,
                      spreadRadius: 1.5),
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: index == 2
                      ? thirdItem()
                      : Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: index == 0 ? 130 : 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(standard!.image!),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20, top: 20),
                                    width: 40,
                                    height: 40,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: BackdropFilter(
                                        filter: new ImageFilter.blur(
                                            sigmaX: 10.0, sigmaY: 10.0),
                                        child: Material(
                                          color: Colors.transparent,
                                          child: InkWell(
                                            onTap: () {},
                                            splashColor: Cst.primaryColor
                                                .withOpacity(0.3),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Cst.softColor
                                                    .withOpacity(0.05),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Icon(LineIcons.bookmarkAlt,
                                                  color: Cst.lightBG
                                                      .withOpacity(0.9)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(standard!.title!,
                                        style: GoogleFonts.montserrat(
                                            color: Cst.colorTxt,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w800,
                                            fontStyle: FontStyle.normal)),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                            "from " +
                                                standard!.price! +
                                                " / week",
                                            style: GoogleFonts.montserrat(
                                                color: Cst.colorTxt
                                                    .withOpacity(0.7),
                                                fontWeight: FontWeight.w600,
                                                fontStyle: FontStyle.normal)),
                                        Spacer(),
                                        index == 1
                                            ? Row(
                                                children: [
                                                  Text("4.9",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color: Cst.darkBG
                                                                  .withOpacity(
                                                                      0.7),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal)),
                                                  SizedBox(width: 5),
                                                  Icon(LineIcons.starAlt,
                                                      color: Colors
                                                          .deepOrangeAccent,
                                                      size: 16),
                                                  SizedBox(width: 5),
                                                  SizedBox(width: 20),
                                                ],
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                ),
              ),
            ),
          ),
        ));
  }

  Widget thirdItem() {
    return Row(
      children: [
        Container(
          width: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(standard!.image!),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text(standard!.title!,
                style: GoogleFonts.montserrat(
                    color: Cst.colorTxt,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal)),
            SizedBox(height: 5),
            Text("from " + standard!.price! + " / week",
                style: GoogleFonts.montserrat(
                    color: Cst.colorTxt.withOpacity(0.7),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal)),
            Spacer(),
            Row(
              children: [
                Text("4.9",
                    style: GoogleFonts.montserrat(
                        color: Cst.darkBG.withOpacity(0.7),
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal)),
                SizedBox(width: 5),
                Icon(LineIcons.starAlt,
                    color: Colors.deepOrangeAccent, size: 16),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
        Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
              icon: Icon(LineIcons.bookmark),
              tooltip: "Save",
              onPressed: (){
                print("Bookmark Clicked");
              },
              color: Cst.softColor.withOpacity(0.9)),
        ),
      ],
    );
  }
}
