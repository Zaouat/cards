import 'package:cards/Helper/Global.dart';
import 'package:cards/Utils/Classes.dart';
import 'package:line_icons/line_icons.dart';

class SimpleCard extends StatelessWidget {
  final Simples? simple;
  final Animation<double>? animation;
  final int? index;

  const SimpleCard({this.simple, this.animation, this.index});
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
                            SizedBox(height: 15),
                            Align(
                              alignment: index == 0
                                  ? Alignment.topLeft
                                  : index == 1
                                      ? Alignment.center
                                      : Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0
                                        ? 15
                                        : index == 1
                                            ? 0
                                            : 15),
                                child: CircleAvatar(
                                  radius: index == 0
                                      ? 25
                                      : index == 1
                                          ? 40
                                          : 25,
                                  backgroundColor: index == 0
                                      ? Cst.primaryColor.withOpacity(0.1)
                                      : index == 1
                                          ? Colors.red.withOpacity(0.1)
                                          : Colors.yellow.withOpacity(0.1),
                                  child: Icon(
                                    LineIcons.byName(
                                      simple!.icon!,
                                    ),
                                    size: index == 1 ? 35 : 25,
                                    color: index == 0
                                        ? Cst.primaryColor
                                        : index == 1
                                            ? Colors.red
                                            : Colors.yellow,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Align(
                              alignment: index == 0
                                  ? Alignment.topLeft
                                  : index == 1
                                      ? Alignment.center
                                      : Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0
                                        ? 15
                                        : index == 1
                                            ? 0
                                            : 15),
                                child: Text(simple!.title!,
                                    style: GoogleFonts.montserrat(
                                        color: Cst.colorTxt,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800,
                                        fontStyle: FontStyle.normal)),
                              ),
                            ),
                            SizedBox(height: 5),
                            Align(
                              alignment: index == 0
                                  ? Alignment.topLeft
                                  : index == 1
                                      ? Alignment.center
                                      : Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: index == 0
                                        ? 15
                                        : index == 1
                                            ? 0
                                            : 15),
                                child: Text(simple!.count! + " products",
                                    style: GoogleFonts.montserrat(
                                        color: Cst.colorTxt.withOpacity(0.7),
                                        fontWeight: FontWeight.w400,
                                        fontStyle: FontStyle.normal)),
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.yellow.withOpacity(0.1),
            child: Icon(
              LineIcons.byName(simple!.icon!),
              color: Colors.yellow,
            ),
          ),
        ),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(simple!.title!,
                style: GoogleFonts.montserrat(
                    color: Cst.colorTxt,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.normal)),
            SizedBox(height: 5),
            Text(simple!.count! + " products",
                style: GoogleFonts.montserrat(
                    color: Cst.colorTxt.withOpacity(0.7),
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal)),
          ],
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
