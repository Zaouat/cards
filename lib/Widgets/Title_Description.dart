import 'package:cards/Helper/Global.dart';

class TitleDesc extends StatelessWidget {
  final String? title;
  final String? des;
  const TitleDesc({this.title, this.des});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(title!,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  color: Cst.colorTxt,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: SelectableText(des!,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  color: Cst.colorTxt,
                  fontSize: 15,
                  height: 1.5,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal)),
        ),
      ],
    );
  }
}
