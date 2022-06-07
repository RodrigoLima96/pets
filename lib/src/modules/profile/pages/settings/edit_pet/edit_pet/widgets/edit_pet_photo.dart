import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pets/src/modules/profile/controllers/edit_pet_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class EditPetPhoto extends StatefulWidget {
  final Size size;
  final String photo;
  const EditPetPhoto({Key? key, required this.size, required this.photo})
      : super(key: key);

  @override
  State<EditPetPhoto> createState() => _EditPetPhotoState();
}

class _EditPetPhotoState extends State<EditPetPhoto> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<EditPetController>();

    return SizedBox(
      height: widget.size.height * 0.28,
      child: Stack(
        children: [
          Container(
            height: widget.size.height * 0.25,
            width: widget.size.width * 0.9,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: controller.image == null
                        ? NetworkImage(
                            widget.photo,
                          )
                        : MemoryImage(controller.image!) as ImageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -5,
            right: 60,
            child: IconButton(
              onPressed: () {
                controller.addImage();
              },
              icon: SvgPicture.asset(
                'assets/icons/edit.svg',
                color: kPrimaryColor,
                width: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
