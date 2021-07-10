import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cards/Helper/Global.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:octo_image/octo_image.dart';
import 'package:vibration/vibration.dart';

class ButtonCard extends StatelessWidget {
  final Buttons? button;
  final Animation<double>? animation;
  final int? index;

  const ButtonCard({this.button, this.animation, this.index});
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
                  onLongPress: () {
                    Vibration.vibrate(
                        duration: 50, amplitude: 24, intensities: [1, 255]);
                  },
                  child: index == 2
                      ? thirdItem()
                      : Stack(
                          children: [
                            index == 0
                                ? Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 45,
                                            backgroundImage: OctoImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            button!.image!),
                                                    progressIndicatorBuilder:
                                                        (context, image) => Center(
                                                            child:
                                                                CupertinoActivityIndicator()),
                                                    errorBuilder:
                                                        OctoError.icon(
                                                            color: Colors.red,
                                                            icon: LineIcons
                                                                .imageAlt),
                                                    fit: BoxFit.cover)
                                                .image,
                                          ),
                                          SizedBox(height: 20),
                                          Text(button!.title!,
                                              style: GoogleFonts.montserrat(
                                                  color: Cst.colorTxt,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w800,
                                                  fontStyle: FontStyle.normal)),
                                          SizedBox(height: 5),
                                          Text(button!.count! + " followers",
                                              style: GoogleFonts.montserrat(
                                                  color: Cst.colorTxt
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal)),
                                          SizedBox(height: 10),
                                          Container(
                                            width: 120,
                                            child: TextButton(
                                                child: Text("Follow",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color:
                                                                Cst.lightColor,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal)),
                                                style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(Cst
                                                                .primaryColor),
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ))),
                                                onPressed: () {}),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        height: 130,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: OctoImage(
                                                    image:
                                                        CachedNetworkImageProvider(
                                                            button!.image!),
                                                    progressIndicatorBuilder:
                                                        (context, image) => Center(
                                                            child:
                                                                CupertinoActivityIndicator()),
                                                    errorBuilder:
                                                        OctoError.icon(
                                                            color: Colors.red,
                                                            icon: LineIcons
                                                                .imageAlt),
                                                    fit: BoxFit.cover)
                                                .image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Stack(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(button!.title!,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Cst.colorTxt,
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontStyle: FontStyle
                                                                .normal)),
                                                SizedBox(height: 5),
                                                Text(
                                                    button!.count! + " members",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Cst.colorTxt
                                                                .withOpacity(
                                                                    0.7),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle: FontStyle
                                                                .normal)),
                                              ],
                                            ),
                                            Align(
                                              alignment: Alignment.bottomRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 20, bottom: 20),
                                                child: TextButton(
                                                    child: Text("View",
                                                        style: GoogleFonts.montserrat(
                                                            color: Cst
                                                                .primaryColor,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontStyle: FontStyle
                                                                .normal)),
                                                    style: ButtonStyle(
                                                        backgroundColor:
                                                            MaterialStateProperty.all<Color>(
                                                                Cst.primaryColor
                                                                    .withOpacity(
                                                                        0.2)),
                                                        shape: MaterialStateProperty.all<
                                                                RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(60),
                                                        ))),
                                                    onPressed: () {}),
                                              ),
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
              image: OctoImage(
                image: CachedNetworkImageProvider(button!.image!),
                errorBuilder:
                    OctoError.icon(color: Colors.red, icon: LineIcons.imageAlt),
                progressIndicatorBuilder: (context, image) =>
                    Center(child: CupertinoActivityIndicator()),
                fit: BoxFit.cover,
              ).image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text("You were invited to",
                style: GoogleFonts.montserrat(
                    color: Cst.colorTxt.withOpacity(0.7),
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal)),
            SizedBox(height: 5),
            Text(button!.title!,
                style: GoogleFonts.montserrat(
                    color: Cst.colorTxt,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal)),
            Spacer(),
            Row(
              children: [
                TextButton(
                    child: Text("Join",
                        style: GoogleFonts.montserrat(
                            color: Cst.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Cst.primaryColor.withOpacity(0.2)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ))),
                    onPressed: () {}),
                SizedBox(width: 10),
                TextButton(
                    child: Text("Remove",
                        style: GoogleFonts.montserrat(
                            color: Cst.colorTxt,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal)),
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ))),
                    onPressed: () {}),
              ],
            ),
            SizedBox(height:5),

          ],
        ),
      ],
    );
  }
}
