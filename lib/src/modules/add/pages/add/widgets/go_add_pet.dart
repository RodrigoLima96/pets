import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/routes/router_utils.dart';
import 'package:pets/src/shared/utils/constants.dart';

class GoAddPet extends StatelessWidget {
  const GoAddPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        width: 200,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/add.svg',
              color: kPrimaryColor,
              width: 25,
            ),
            const SizedBox(width: 10),
            const Text(
              'Add a new Pet',
              style: textStyle,
            ),
          ],
        ),
      ),
      onTap: () => context.pushNamed(AppPage.addPet.toName),
    );
  }
}
