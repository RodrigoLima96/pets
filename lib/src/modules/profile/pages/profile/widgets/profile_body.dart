import 'package:flutter/material.dart';
import 'package:pets/src/modules/profile/controllers/profile_controller.dart';
import 'package:pets/src/modules/profile/pages/profile/widgets/list_name.dart';
import 'package:pets/src/shared/widgets/pets_list.dart';
import 'package:pets/src/modules/profile/pages/profile/widgets/profile_user_info.dart';
import 'package:pets/src/modules/profile/pages/profile/widgets/settings.dart';
import 'package:pets/src/shared/utils/methods.dart';
import 'package:provider/provider.dart';

class EditPet extends StatefulWidget {
  final String uid;
  const EditPet({Key? key, required this.uid}) : super(key: key);

  @override
  State<EditPet> createState() => _EditPetState();
}

class _EditPetState extends State<EditPet> {
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
    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: double.infinity,
        padding: EdgeInsets.only(top: size.height * 0.05),
        child: controller.state == ProfileState.loading
            ? loadingWidget()
            : Column(
                children: [
                  Stack(
                    children: [
                      Settings(
                        notifications: 3,
                        user: controller.user,
                        pets: controller.petsList,
                      ),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: ProfileUserInfo(user: controller.user),
                      )),
                    ],
                  ),
                  ListName(name: 'PETS', size: size),
                  controller.petsList.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text('No Pets Yet'),
                        )
                      : PetsList(
                          size: size,
                          pets: controller.petsList,
                          imageRadius: 30),
                ],
              ),
      ),
    );
  }
}
