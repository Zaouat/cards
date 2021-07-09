import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cards/Helper/Global.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:octo_image/octo_image.dart';
import 'package:vibration/vibration.dart';

class AsGbCard extends StatelessWidget {
  final AsGb? asgb;
  final Animation<double>? animation;
  final int? index;

  const AsGbCard({this.asgb, this.animation, this.index});
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
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: OctoImage(
                      color: Cst.lightColor,
                      image: CachedNetworkImageProvider(asgb!.image!),
                      progressIndicatorBuilder: (context,image) => Center(child: CupertinoActivityIndicator()),
                      errorBuilder: OctoError.icon(color: Colors.red,icon: LineIcons.imageAlt),
                      fit: BoxFit.cover

                  ).image,
                  fit: BoxFit.cover,
                ),
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
                  onLongPress: ()  {
                    Vibration.vibrate(duration: 50, amplitude: 24, intensities: [1, 255]);
                  },
                  child: Column(
                    children: [
                      Spacer(),
                      Align(
                        alignment: index==0?Alignment.center : Alignment.bottomLeft,
                        child: Padding(
                          padding:  EdgeInsets.only(left:index != 0 ?15: 0),
                          child: Text(asgb!.title!,
                              style: GoogleFonts.montserrat(
                                  color: Cst.lightColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.normal)),
                        ),
                      ),
                      Align(
                        alignment: index==0?Alignment.center : Alignment.bottomLeft,
                        child: Padding(
                          padding:  EdgeInsets.only(left:index != 0 ?15: 0),
                          child: Text(asgb!.count! + " albums",
                              style: GoogleFonts.montserrat(
                                  color: Cst.lightColor.withOpacity(0.9),
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.normal)),
                        ),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

}
