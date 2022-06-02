import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/pages/feed/widgets/feed_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBlack,
      body: FeedBody(),
    );
  }
}
