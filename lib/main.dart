import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:password_generator/src/pages/home/home_page.dart';
import 'package:password_generator/src/shared/themes/colors.dart';

void main() {
  runApp(MyApp());
  doWhenWindowReady(() {
    var initialSize = Size(600, 500);
    appWindow.size = initialSize;
    appWindow.minSize = initialSize;
    appWindow.maxSize = initialSize;
    appWindow.title = "Gerador de senha";
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerador de senha',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.cyan,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
      home: HomePage(),
    );
  }
}
