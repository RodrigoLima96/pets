import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pets/src/modules/profile/controllers/edit_user_controller.dart';
import 'package:pets/src/routes/router_utils.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:pets/src/shared/widgets/rounded_button.dart';
import 'package:provider/provider.dart';

class UpdateUserButton extends StatelessWidget {
  final Size size;
  final String uid;
  final TextEditingController name;
  final GlobalKey<FormState> formKey;

  const UpdateUserButton({
    Key? key,
    required this.size,
    required this.uid,
    required this.name,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EditUserController>();

    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.1),
      child: controller.state == EditUserState.loading
          ? const Center(child: CircularProgressIndicator())
          : RoundedButton(
              text: 'UPDATE',
              press: () {
                if (formKey.currentState!.validate()) {
                  controller.updateUser(uid, name.text);
                  controller.addListener(() {
                    if (controller.state == EditUserState.success) {
                      showSnackBar(context, 'update success');
                      context.goNamed(AppPage.home.toName);
                    }
                  });
                }
              },
              color: kPrimaryColor,
              textColor: kWhite,
              size: size,
            ),
    );
  }
}
