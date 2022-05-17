import 'package:flutter/material.dart';
import 'package:pets/src/modules/add/widgets/add_body.dart';
import 'package:pets/src/shared/utils/constants.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBlack,
      body: AddBody(),
    );
  }
}
