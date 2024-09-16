import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/layouts/home.dart';
import 'package:news_app/layouts/theme.dart';
import 'package:news_app/screens/articleScreen.dart';
import 'package:news_app/screens/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 870),
      builder: (context, child) {
        return MaterialApp(
          theme: MyTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.Route,
          routes: {
            "Articlescreen": (context) => Articlescreen(),
            "HomeScreen": (context) => HomeScreen(),
            "SplashScreen": (context) => SplashScreen(),
          },
        );
      },
    );
  }
}
