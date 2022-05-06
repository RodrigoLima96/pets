import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/controllers/feed_controller.dart';
import 'package:pets/src/modules/feed/widgets/post_card.dart';
import 'package:provider/provider.dart';

class PostsList extends StatelessWidget {
  const PostsList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<FeedController>();

    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.posts.length,
      itemBuilder: (context, index) => PostCard(
        post: controller.posts[index],
        size: size,
      ),
    );
  }
}
