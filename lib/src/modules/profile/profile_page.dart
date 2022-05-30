import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/controllers/profile_controller.dart';
import 'package:pets/src/modules/profile/widgets/profile_body.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProfileController>().loadUserInfo(widget.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlack,
      body: ProfileBody(uid: widget.uid),
    );
  }
}
