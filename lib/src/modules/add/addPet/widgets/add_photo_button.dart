import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/modules/add/controllers/add_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class AddPhotoButton extends StatelessWidget {
  const AddPhotoButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddController>();
    debugPrint('ué');
    return GestureDetector(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/gallery.svg',
              color: kPrimaryColor,
            ),
            const SizedBox(width: 10),
            const Text(
              'Add a Photo',
              style: textStyle,
            ),
          ],
        ),
      ),
      onTap: () => controller.addImage(),
    );
  }
}
