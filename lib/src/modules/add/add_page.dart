import 'package:flutter/material.dart';
import 'package:pets/src/shared/utils/constants.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBlack,
      body: Center(child: Text('add page')),
    );
  }
}
