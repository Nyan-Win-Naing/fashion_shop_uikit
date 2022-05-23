import 'package:fashion_shop_uikit/resources/dimens.dart';
import 'package:flutter/material.dart';

const kAnimationDurationForShownDescriptionButton =
    Duration(milliseconds: 1000);

/// State
bool isAnimationComplete = false;

late AnimationController showDescriptionAnimationController;
late Animation<double> rotationAnimation;

class ExplicitAnimationShownDescriptionButton extends StatefulWidget {
  @override
  State<ExplicitAnimationShownDescriptionButton> createState() =>
      _ExplicitAnimationShownDescriptionButtonState();
}

class _ExplicitAnimationShownDescriptionButtonState
    extends State<ExplicitAnimationShownDescriptionButton>
    with TickerProviderStateMixin {

  @override
  void initState() {
    super.initState();

    showDescriptionAnimationController = AnimationController(
      duration: kAnimationDurationForShownDescriptionButton,
      vsync: this,
    );

    rotationAnimation =
        Tween<double>(begin: 0, end: 0.5).animate(showDescriptionAnimationController.view);

    showDescriptionAnimationController.addStatusListener((status) {
      isAnimationComplete = (status == AnimationStatus.completed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: showDescriptionAnimationController.view,
      builder: (context, _child) => RotationTransition(
        turns: rotationAnimation,
        child: Icon(
          Icons.arrow_drop_up,
          size: MARGIN_XLARGE + 10,
        ),
      ),
    );
  }
}
