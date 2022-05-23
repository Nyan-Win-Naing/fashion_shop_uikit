import 'package:fashion_shop_uikit/resources/dimens.dart';
import 'package:flutter/material.dart';

const kAnimationDurationForFavourite = Duration(milliseconds: 1000);

class ExplicitAnimationFavouriteButton extends StatefulWidget {
  @override
  State<ExplicitAnimationFavouriteButton> createState() =>
      _ExplicitAnimationFavouriteButtonState();
}

class _ExplicitAnimationFavouriteButtonState
    extends State<ExplicitAnimationFavouriteButton>
    with TickerProviderStateMixin {
  /// State
  bool isAnimationComplete = false;

  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: kAnimationDurationForFavourite,
      vsync: this,
    );

    _colorAnimation =
        ColorTween(begin: Color.fromRGBO(0, 0, 0, 0.5), end: Colors.red)
            .animate(_controller.view);

    _rotationAnimation =
        Tween<double>(begin: 0, end: 1).animate(_controller.view);

    _controller.addStatusListener((status) {
      isAnimationComplete = (status == AnimationStatus.completed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (context, _) => RotationTransition(
        turns: _rotationAnimation,
        child: IconButton(
          onPressed: () {
            if (isAnimationComplete) {
              _controller.reverse();
            } else {
              _controller.forward();
            }
          },
          icon: Icon(
            Icons.favorite,
            size: MARGIN_XLARGE + 3,
            color: _colorAnimation.value,
          ),
        ),
      ),
    );
  }
}
