import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/models/catogryModel.dart';
import 'package:news_app/screens/catogryScreen.dart';
import 'package:news_app/screens/drawer_Tab.dart';
import 'package:news_app/screens/new_Screen.dart';
import 'package:news_app/screens/widgets/searchD.dart';

class HomeScreen extends StatefulWidget {
  static const String Route = "HomeScreen";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Catogrymodel? catogryy;
  bool search = false;
  bool catog = true;

  TextEditingController searchC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              catogryy == null ? "News App!" : catogryy!.title,
            ),
            actions: catog
                ? null
                : search
                    ? null
                    : [
                        Padding(
                          padding: EdgeInsets.only(right: 25.w),
                          child: IconButton(
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: SearchD());
                              },
                              icon: Icon(
                                Icons.search_rounded,
                                size: 40.sp,
                              )),
                        ),
                      ],
          ),
          drawer: search
              ? null
              : Drawer(child: DrawerTab(onClick: () {
                  catogryy = null;
                  catog = true;
                  setState(() {});
                  Navigator.pop(context);
                })),
          body: catogryy == null
              ? Catogryscreen(onClicked: (cat) {
                  catogryy = cat;
                  catog = false;
                  setState(() {});
                })
              : NewsScreen(
                  catogryId: catogryy!.id,
                )),
    );
  }
}
