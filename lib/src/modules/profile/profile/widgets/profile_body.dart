import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/profile/controllers/profile_controller.dart';
import 'package:pets/src/modules/profile/profile/widgets/list_name.dart';
import 'package:pets/src/modules/profile/profile/widgets/pets_list.dart';
import 'package:pets/src/modules/profile/profile/widgets/profile_user_info.dart';
import 'package:pets/src/modules/profile/profile/widgets/reviews/caretaker_reviews.dart';
import 'package:pets/src/modules/profile/profile/widgets/settings_and_notification.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:provider/provider.dart';

class ProfileBody extends StatefulWidget {
  final String uid;
  const ProfileBody({Key? key, required this.uid}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    context.read<ProfileController>().loadUserInfo(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = context.watch<ProfileController>();
    debugPrint('create');
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        padding: EdgeInsets.only(top: size.height * 0.05),
        child: controller.state == ProfileState.loading
            ? loading()
            : Column(
                children: [
                  Stack(
                    children: [
                      SettingsAndNotifications(
                        notifications: 3,
                        user: controller.user,
                      ),
                      ProfileUserInfo(user: controller.user),
                    ],
                  ),
                  ListName(name: 'PETS', size: size),
                  PetsList(size: size, pets: controller.petsList),
                  ListName(name: 'CARETAKER', size: size),
                  PetsList(size: size, pets: controller.caretakerList),
                  CaretakerReviews(reviews: controller.reviews),
                ],
              ),
      ),
    );
  }
}
