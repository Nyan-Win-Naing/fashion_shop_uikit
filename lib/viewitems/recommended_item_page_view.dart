import 'package:fashion_shop_uikit/resources/colors.dart';
import 'package:fashion_shop_uikit/resources/dimens.dart';
import 'package:flutter/material.dart';

class RecommendedItemView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 205, 210, 0.4),
                borderRadius:
                BorderRadius.circular(MARGIN_MEDIUM_3),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/item_1.png",
                      height: 80,
                    ),
                    SizedBox(height: MARGIN_MEDIUM_2),
                    Text(
                      "Shoes",
                      style: TextStyle(
                        color: SECONDARY_PINK_COLOR,
                        fontSize: TEXT_REGULAR_2X + 2,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: MARGIN_MEDIUM_3),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(197, 202, 233, 0.5),
                borderRadius:
                BorderRadius.circular(MARGIN_MEDIUM_3),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/item_2.png",
                      height: 80,
                    ),
                    SizedBox(height: MARGIN_MEDIUM_2),
                    Text(
                      "Cactus",
                      style: TextStyle(
                        color: Color.fromRGBO(70,40,162, 0.6),
                        fontSize: TEXT_REGULAR_2X + 2,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}