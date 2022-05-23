import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/add/controllers/add_controller.dart';
import 'package:pets/src/modules/add/addPost/add_post_page.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:provider/provider.dart';

class HeaderPost extends StatefulWidget {
  const HeaderPost({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<HeaderPost> createState() => _HeaderPostState();
}

class _HeaderPostState extends State<HeaderPost> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<AddController>();
    return SizedBox(
      width: widget.size.width * 0.8,
      child: Row(
        children: [
          Consumer<AddController>(
            builder: (context, controller, _) => Text(
              controller.selected.length.toString(),
              style: textStyle.copyWith(fontSize: 20),
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              if (controller.selected.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AddPostPage(
                      pets: controller.selected,
                    ),
                  ),
                );
              } else {
                showSnackBar(context, 'Select a pet');
              }
            },
            child: Text(
              'POST',
              style: textStyle.copyWith(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
