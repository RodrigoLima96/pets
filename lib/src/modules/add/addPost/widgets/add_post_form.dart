import 'package:flutter/material.dart';
import 'package:pets/src/shared/widgets/input_text.dart';

class AddPostForm extends StatelessWidget {
  const AddPostForm({
    Key? key,
    required this.size,
    required this.priceController,
    required this.daysController,
  }) : super(key: key);

  final Size size;
  final TextEditingController priceController;
  final TextEditingController daysController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.2, vertical: size.height * 0.05),
      child: Form(
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: InputText(
                controller: priceController,
                hintText: 'Price',
                validator: (value) => null,
                keyboardType: TextInputType.number,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: size.width * 0.2,
              child: InputText(
                controller: daysController,
                hintText: 'Days',
                validator: (value) => null,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
