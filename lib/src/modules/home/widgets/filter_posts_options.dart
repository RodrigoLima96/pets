import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:pets/src/shared/utils/constants.dart';

class FilterPostsOptions extends StatefulWidget {
  const FilterPostsOptions({Key? key}) : super(key: key);

  @override
  State<FilterPostsOptions> createState() => _FilterPostsOptionsState();
}

class _FilterPostsOptionsState extends State<FilterPostsOptions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: kBlack,
              unselectedBackgroundColor: kBlack,
              borderColor: kPrimaryColor,
              borderWidth: 2,
              labelStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  child: Text(
                    'ALL',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'DOGS',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'CATS',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'BIRDS',
                    style: TextStyle(
                      color: kWhite,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
