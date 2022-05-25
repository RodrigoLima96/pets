import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class TestePage extends StatefulWidget {
  const TestePage({
    Key? key,
  }) : super(key: key);

  @override
  State<TestePage> createState() => _TestePageState();
}

class _TestePageState extends State<TestePage> {
  @override
  StreamController<Widget> overlayController =
      StreamController<Widget>.broadcast();
  int count = 0;

  final assets = const [
    Image(image: AssetImage('assets/images/logo.png')),
    Image(image: AssetImage('assets/images/logo.png')),
    Image(image: AssetImage('assets/images/logo.png')),
  ];

  @override
  void dispose() {
    overlayController.close();
    super.dispose();
  }

  Widget appBarText(String text) {
    return Text(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarText(count.toString()),
      ),
      body: Container(
          child: Center(
        child: TextButton(
          onPressed: () {
            SwipeImageGallery(
              context: context,
              children: assets,
              onSwipe: (index) {
                overlayController
                    .add(appBarText('${index + 1} /${assets.length}'));
              },
              overlayController: overlayController,
              initialOverlay: appBarText('1/${assets.length}'),
            ).show();
          },
          child: Text('TESTE'),
        ),
      )),
    );
  }
}
