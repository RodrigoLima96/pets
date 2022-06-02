import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/controllers/add_controller.dart';
import 'package:pets/src/shared/utils/constants.dart';
import 'package:provider/provider.dart';

class PetsList extends StatefulWidget {
  const PetsList({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<PetsList> createState() => _PetsListState();
}

class _PetsListState extends State<PetsList> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddController>();

    if (controller.state == AddState.loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return (controller.pets.isEmpty)
        ? Center(
            child: Container(
              padding: EdgeInsets.only(top: widget.size.height * 0.1),
              child: const Text(
                'No pets added yet',
                style: textStyle,
              ),
            ),
          )
        : Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          controller.pets[i].photoUrl,
                        ),
                      ),
                      title: Text(controller.pets[i].petName, style: textStyle),
                      trailing: Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kPrimaryColor,
                            width: 2,
                          ),
                          color:
                              controller.selected.contains(controller.pets[i])
                                  ? kPrimaryColor
                                  : Colors.transparent,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                      onTap: () => controller.selectedPet(controller.pets[i]),
                    ),
                  );
                },
                itemCount: controller.pets.length,
                padding: const EdgeInsets.symmetric(horizontal: 30),
              ),
            ),
          );
  }
}
