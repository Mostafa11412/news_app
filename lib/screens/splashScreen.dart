import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/layouts/home.dart';

class SplashScreen extends StatelessWidget {
  static const String Route = "SplashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      duration: Duration(seconds: 1),
      nextScreen: HomeScreen(),
      backgroundColor: Colors.white,
      splashScreenBody: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/pattern.png",
                ),
                fit: BoxFit.fill)),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 338.h,
              ),
              Image.asset("assets/images/logo.png"),
              Spacer(),
              Image.asset("assets/images/Group.png")
            ],
          ),
        ),
      ),
    );
  }
}
