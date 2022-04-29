import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/widgets/filter_posts_options.dart';
import 'package:pets/src/modules/feed/widgets/header_feed.dart';
import 'package:pets/src/modules/feed/widgets/post_card.dart';

class FeedBody extends StatefulWidget {
  const FeedBody({Key? key}) : super(key: key);

  @override
  State<FeedBody> createState() => _FeedBodyState();
}

class _FeedBodyState extends State<FeedBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      padding: EdgeInsets.only(top: size.height * 0.09),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HeaderFeed(),
            SizedBox(
              height: size.height * 0.07,
            ),
            const FilterPostsOptions(),
            SizedBox(height: size.height * 0.1),
            PostCard(size: size),
            SizedBox(height: size.height * 0.05),
            PostCard(size: size),
            SizedBox(height: size.height * 0.1),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              },
              child: const Text('SAIR'),
            ),
          ],
        ),
      ),
    );
  }
}
