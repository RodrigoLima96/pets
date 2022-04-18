import 'package:flutter/material.dart';
import 'package:pets/src/modules/home/widgets/filter_posts_options.dart';
import 'package:pets/src/modules/home/widgets/header_home.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        padding: EdgeInsets.only(top: size.height * 0.09),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HeaderHome(),
            SizedBox(
              height: size.height * 0.07,
            ),
            const FilterPostsOptions(),
          ],
        ),
      ),
    );
  }
}
