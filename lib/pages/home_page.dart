import 'package:dots_indicator/dots_indicator.dart';
import 'package:fashion_shop_uikit/resources/colors.dart';
import 'package:fashion_shop_uikit/resources/dimens.dart';
import 'package:fashion_shop_uikit/viewitems/recommended_item_page_view.dart';
import 'package:fashion_shop_uikit/viewitems/trending_page_view.dart';
import 'package:flutter/material.dart';

const kAnimationDurationForScreenFadeIn = Duration(milliseconds: 1000);

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final avatarRadius = screenHeight / 28;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                TweenAnimationBuilder(
                  duration: kAnimationDurationForScreenFadeIn,
                  builder: (context, double _value, child) => Opacity(
                    opacity: _value,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MARGIN_LARGE,
                        vertical: _value * MARGIN_XXLARGE,
                      ),
                      child: child,
                    ),
                  ),
                  tween: Tween<double>(begin: 0, end: 1),
                  child: ProfileSectionView(avatarRadius: avatarRadius),
                ),
                TrendingSectionView(screenHeight: screenHeight),
                SizedBox(height: MARGIN_XLARGE),
                RecommendedSectionView(screenHeight: screenHeight),
                SizedBox(height: MARGIN_3XLARGE + MARGIN_3XLARGE),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: MARGIN_MEDIUM_3,
                left: MARGIN_MEDIUM_3,
                right: MARGIN_MEDIUM_3,
              ),
              child: BottomNavigationBarSectionView(),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationBarSectionView extends StatelessWidget {
  const BottomNavigationBarSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MARGIN_XXLARGE),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            spreadRadius: 2,
            blurRadius: 1,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BottomNavIconView(icon: Icons.home_filled, color: BLUE_DARK_COLOR),
          BottomNavIconView(icon: Icons.search_outlined),
          BottomNavIconView(
            icon: Icons.shopify,
            size: MARGIN_XXLARGE - 6,
          ),
          BottomNavIconView(
            icon: Icons.bookmark_border,
            size: MARGIN_XXLARGE - 12,
          ),
          CircleAvatar(
            radius: screenHeight / 35,
            backgroundImage: NetworkImage(
                "https://media.allure.com/photos/626022b963478f170288aa91/3:4/w_1500,h_2000,c_limit/4-20-lady%20gaga.png"),
          )
        ],
      ),
    );
  }
}

class BottomNavIconView extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;

  BottomNavIconView({
    required this.icon,
    this.color = HOME_PAGE_ICON_COLOR,
    this.size = MARGIN_XXLARGE - 8,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    );
  }
}

class RecommendedSectionView extends StatelessWidget {
  const RecommendedSectionView({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
          child: TitleAndIndicatorSectionView(title: "Recommended"),
        ),
        SizedBox(height: MARGIN_LARGE),
        Container(
          height: screenHeight / 5,
          // color: Colors.blueAccent,
          child: PageView(
            children: [
              RecommendedItemView(),
              RecommendedItemView(),
            ],
          ),
        )
      ],
    );
  }
}

class TrendingSectionView extends StatelessWidget {
  const TrendingSectionView({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
          child: TitleAndIndicatorSectionView(
            title: "Trending for you",
          ),
        ),
        SizedBox(height: MARGIN_LARGE),
        Container(
          height: screenHeight / 2.5,
          // color: Colors.blueAccent,
          child: PageView(
            children: [
              TrendingPageView(),
            ],
          ),
        )
      ],
    );
  }
}

class TitleAndIndicatorSectionView extends StatelessWidget {
  final String title;

  TitleAndIndicatorSectionView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w600,
          ),
        ),
        DotsIndicator(
          dotsCount: 2,
          position: 0,
          decorator: DotsDecorator(
            color: Color.fromRGBO(187, 186, 195, 1.0),
            activeColor: Color.fromRGBO(47, 43, 76, 1.0),
            size: Size(7, 7),
            activeSize: Size(7, 7),
          ),
        ),
      ],
    );
  }
}

class ProfileSectionView extends StatelessWidget {
  const ProfileSectionView({
    Key? key,
    required this.avatarRadius,
  }) : super(key: key);

  final double avatarRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: avatarRadius,
              backgroundImage: NetworkImage(
                "https://i.guim.co.uk/img/media/42ee2512a183105cc0b4878a36f6136acb44aae8/0_427_3500_2100/master/3500.jpg?width=1200&height=1200&quality=85&auto=format&fit=crop&s=74149a0218584cf1258aa40541587a26",
              ),
            ),
            SizedBox(width: MARGIN_MEDIUM_2),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Howdy,",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: TEXT_REGULAR_3X,
                  ),
                ),
                SizedBox(height: MARGIN_SMALL),
                Text(
                  "Cristina Yota",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: TEXT_REGULAR_3X,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 50,
          width: 45,
          // color: Colors.blueAccent,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.notifications_none,
                  color: HOME_PAGE_ICON_COLOR,
                  size: MARGIN_XLARGE + 3,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: MARGIN_MEDIUM,
                    right: MARGIN_SMALL,
                  ),
                  child: Container(
                    width: 9,
                    height: 9,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(214, 171, 200, 1.0),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
