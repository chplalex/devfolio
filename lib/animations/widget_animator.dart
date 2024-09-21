import 'dart:async';

import 'package:flutter/material.dart';

Timer? _timer;
Duration _duration = const Duration();

Duration _wait() {
  if (_timer == null || !_timer!.isActive) {
    _timer = Timer(const Duration(microseconds: 120), () {
      _duration = const Duration();
    });
  }
  _duration += const Duration(milliseconds: 100);
  return _duration;
}

class WidgetAnimator extends StatelessWidget {
  final Widget child;

  const WidgetAnimator({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return _Animator(key, child, _wait());
  }
}

class _Animator extends StatefulWidget {
  final Widget? child;
  final Duration? time;

  const _Animator(
      Key? key,
      this.child,
      this.time,
      ) : super(key: key);

  @override
  _AnimatorState createState() => _AnimatorState();
}

class _AnimatorState extends State<_Animator> with SingleTickerProviderStateMixin {
  Timer? timer;
  AnimationController? animationController;
  Animation? animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(duration: const Duration(milliseconds: 290), vsync: this);
    animation = CurvedAnimation(parent: animationController!, curve: Curves.easeInOut);
    timer = Timer(widget.time!, animationController!.forward);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation!,
      child: widget.child,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: animation!.value,
          child: Transform.translate(
            offset: Offset(0.0, (1 - animation!.value) * 20),
            child: child,
          ),
        );
      },
    );
  }
}

