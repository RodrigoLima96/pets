import 'package:flutter/material.dart';
import 'package:pets/src/models/post.dart';
import 'package:pets/src/modules/feed/pages/post/post_page.dart';

class UserPosts extends StatelessWidget {
  final List<Post> posts;
  const UserPosts({
    Key? key,
    required this.posts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return posts.isEmpty
        ? const Center(child: Text('No posts yet'))
        : GridView.builder(
            shrinkWrap: true,
            itemCount: posts.length,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 1.5,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostPage(post: posts[index])));
                },
                child: Image.network(
                  posts[index].petsPhotosUrl[0],
                  fit: BoxFit.cover,
                ),
              );
            },
          );
  }
}
