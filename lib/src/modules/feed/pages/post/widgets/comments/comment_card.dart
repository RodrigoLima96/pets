import 'package:flutter/material.dart';
import 'package:pets/src/models/comment.dart';
import 'package:pets/src/modules/feed/pages/post/widgets/comments/delete_comment_button.dart';
import 'package:pets/src/shared/utils/methods.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  const CommentCard({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(comment.photoUrl),
            radius: 18,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: comment.username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' ${comment.comment}',
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        dateFormat(comment.datePublished),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          DeleteCommentButton(
            comment: comment,
          )
        ],
      ),
    );
  }
}
