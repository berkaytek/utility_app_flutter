import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/timer/bloc/timer_bloc.dart';

class AnimatedHourglassLogo extends StatefulWidget {
  const AnimatedHourglassLogo({super.key});

  @override
  State<AnimatedHourglassLogo> createState() => _AnimatedHourglassLogoState();
}

class _AnimatedHourglassLogoState extends State<AnimatedHourglassLogo>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  _AnimatedHourglassLogoState();

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: 1).animate(animationController);
    animation.addStatusListener((AnimationStatus status) => {
      if(status == AnimationStatus.completed){
        animationController.reset()
      }
    });
    animation.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TimerBloc, TimerState>(
      listener: (context, state) => {
        if (state is TimerInProgress)
          {animationController.forward()}
        else
          {animationController.stop()}
      },
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: RotationTransition(
              turns: animation,
              child: const Icon(
                Icons.hourglass_bottom,
                size: 64,
              )),
        ),
      ),
    );
  }
}
