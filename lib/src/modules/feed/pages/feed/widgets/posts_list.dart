import 'package:flutter/material.dart';
import 'package:pets/src/modules/feed/controllers/feed_controller.dart';
import 'package:pets/src/modules/feed/pages/feed/widgets/post_card/post_card.dart';
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

    if (controller.state == FeedState.loading) {
      return SizedBox(
          height: size.height * 0.5,
          child: const Center(
            child: CircularProgressIndicator(),
          ));
    } else if (controller.state == FeedState.error) {
      return SizedBox(
          height: size.height * 0.5,
          child: const Center(
            child: Text('Error'),
          ));
    } else if (controller.posts.isEmpty) {
      return SizedBox(
        height: size.height * 0.5,
        child: const Center(
            child: Text(
          'No pets yet',
        )),
      );
    }
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
