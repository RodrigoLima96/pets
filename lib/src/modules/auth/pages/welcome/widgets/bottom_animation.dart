import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BottomAnimation extends StatefulWidget {
  const BottomAnimation({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<BottomAnimation> createState() => _BottomAnimationState();
}

class _BottomAnimationState extends State<BottomAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: -110,
      child: Lottie.asset('assets/animations/login.json',
          width: widget.size.width * 0.8,
          controller: _controller, onLoaded: (composition) {
        _controller
          ..duration = composition.duration
          ..repeat();
      }),
    );
  }
}
