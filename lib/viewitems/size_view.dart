import 'package:fashion_shop_uikit/dummy/dummy_size_vo.dart';
import 'package:fashion_shop_uikit/resources/dimens.dart';
import 'package:flutter/material.dart';

class SizeView extends StatelessWidget {

  final DummySizeVO sizeVo;

  SizeView({required this.sizeVo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
        color: Color.fromRGBO(228, 224, 226, 1.0),
        borderRadius: BorderRadius.circular(MARGIN_CARD_MEDIUM_2),
      ),
      child: Center(
        child: Text(
          sizeVo.size ?? "",
          style: TextStyle(
            color: Color.fromRGBO(159, 159, 159, 1.0),
            fontWeight: FontWeight.w600,
            fontSize: TEXT_REGULAR_3X,
          ),
        ),
      ),
    );
  }
}