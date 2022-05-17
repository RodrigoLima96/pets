import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/src/modules/home/pages.dart';
import 'package:pets/src/shared/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    setState(() {});
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
        children: appPages,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: kBlack,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.add_circle_outline,
            color: _page == 0 ? kWhite : kPrimaryColor,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.home,
            color: _page == 1 ? kWhite : kPrimaryColor,
          )),
          BottomNavigationBarItem(
              icon: Icon(
            Icons.person,
            color: _page == 2 ? kWhite : kPrimaryColor,
          )),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
