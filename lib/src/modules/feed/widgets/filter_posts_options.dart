import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:pets/src/modules/feed/controllers/feed_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class FilterPostsOptions extends StatefulWidget {
  const FilterPostsOptions({Key? key}) : super(key: key);

  @override
  State<FilterPostsOptions> createState() => _FilterPostsOptionsState();
}

class _FilterPostsOptionsState extends State<FilterPostsOptions> {
  @override
  Widget build(BuildContext context) {
    var controller = context.watch<FeedController>();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DefaultTabController(
        length: 4,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              onTap: (index) {
                controller.getPosts(index);
              },
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: kBlack,
              unselectedBackgroundColor: kBlack,
              borderColor: kPrimaryColor,
              borderWidth: 2,
              labelStyle: textStyle.copyWith(color: Colors.white),
              tabs: [
                Tab(
                  child: Text(
                    'ALL',
                    style: textStyle.copyWith(fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    'DOGS',
                    style: textStyle.copyWith(fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    'CATS',
                    style: textStyle.copyWith(fontSize: 15),
                  ),
                ),
                Tab(
                  child: Text(
                    'BIRDS',
                    style: textStyle.copyWith(
                      fontSize: 15,
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
