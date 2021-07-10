import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cards/Helper/Global.dart';
import 'package:flutter/services.dart';
void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var style = SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Cst.lightBG,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light);
    SystemChrome.setSystemUIOverlayStyle(style);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: Cst.appName,
      initialRoute: "/",
      routes: {
        '/': (context) {
          return HomePage();
        },
      },
    );
  }
}
