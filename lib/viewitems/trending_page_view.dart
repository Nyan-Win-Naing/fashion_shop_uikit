import 'package:fashion_shop_uikit/resources/colors.dart';
import 'package:fashion_shop_uikit/resources/dimens.dart';
import 'package:flutter/material.dart';

class TrendingPageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(MARGIN_LARGE),
          image: const DecorationImage(
            image: AssetImage(
              "assets/background.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: HeartIconView(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                "assets/girl.png",
                height: 280,
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: MARGIN_LARGE, bottom: MARGIN_LARGE),
                child: TrendingAndModelDescriptionView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrendingAndModelDescriptionView extends StatelessWidget {
  const TrendingAndModelDescriptionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "NEW 2020",
          style: TextStyle(
            color: SECONDARY_PINK_COLOR,
            fontWeight: FontWeight.w600,
            fontSize: TEXT_REGULAR_3X,
          ),
        ),
        SizedBox(height: MARGIN_CARD_MEDIUM_2),
        Text(
          "Modern Outfit\nCollection",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: TEXT_HEADING_1X,
          ),
        ),
        SizedBox(height: MARGIN_CARD_MEDIUM_2),
        Row(
          children: [
           CircleAvatar(
             radius: MediaQuery.of(context).size.height / 40,
             backgroundImage: NetworkImage(
               "https://c4.wallpaperflare.com/wallpaper/950/699/693/women-carmen-electra-model-face-wallpaper-preview.jpg",
             ),
           ),
            SizedBox(width: MARGIN_CARD_MEDIUM_2 + 2),
            Text(
              "Firna Surapt",
              style: TextStyle(
                color: SECONDARY_PINK_COLOR,
                fontWeight: FontWeight.w600,
                fontSize: TEXT_REGULAR_2X + 2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class HeartIconView extends StatelessWidget {
  const HeartIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: MARGIN_LARGE, right: MARGIN_LARGE),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromRGBO(243, 169, 200, 1.0),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            Icons.favorite_border,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
