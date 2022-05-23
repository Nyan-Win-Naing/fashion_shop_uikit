import 'package:dots_indicator/dots_indicator.dart';
import 'package:fashion_shop_uikit/dummy/dummy_size_list.dart';
import 'package:fashion_shop_uikit/explicit_animations/explicit_animation_favourite_button.dart';
import 'package:fashion_shop_uikit/explicit_animations/explicit_animation_shown_description_button.dart';
import 'package:fashion_shop_uikit/resources/colors.dart';
import 'package:fashion_shop_uikit/resources/dimens.dart';
import 'package:fashion_shop_uikit/viewitems/size_view.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailPageSliverAppBar(
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.only(top: MARGIN_MEDIUM_2),
                  child: OutfitIdeaTitleView(),
                ),
                SizedBox(height: MARGIN_MEDIUM_2),
                DressNameSectionView(),
                SizedBox(height: MARGIN_MEDIUM_2),
                DressPriceSectionView(),
                SizedBox(height: MARGIN_XLARGE),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
                  child: DescriptionSectionView(),
                ),
                SizedBox(height: MARGIN_XLARGE),
                SizeYourSizeSectionView(),
                SizedBox(
                  height: MARGIN_XXLARGE,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SizeYourSizeSectionView extends StatelessWidget {
  const SizeYourSizeSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_3),
          child: DetailPageTitleView(
              title: "Size your size", isDescription: false),
        ),
        SizedBox(height: MARGIN_MEDIUM_3),
        GridView.builder(
          itemCount: dummySizeList.length,
          padding: EdgeInsets.only(left: MARGIN_MEDIUM_3),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            childAspectRatio: 3 / 2.5,
          ),
          itemBuilder: (context, index) {
            return SizeView(
              sizeVo: dummySizeList[index],
            );
          },
        ),
      ],
    );
  }
}

class DescriptionSectionView extends StatefulWidget {
  @override
  State<DescriptionSectionView> createState() => _DescriptionSectionViewState();
}

class _DescriptionSectionViewState extends State<DescriptionSectionView> {
  bool isDescriptionShown = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Description",
              style: TextStyle(
                fontSize: TEXT_REGULAR_3X,
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isAnimationComplete) {
                  showDescriptionAnimationController.reverse();
                } else {
                  showDescriptionAnimationController.forward();
                }
                setState(() {
                  isDescriptionShown = !isDescriptionShown;
                });
              },
              child: ExplicitAnimationShownDescriptionButton(),
            ),
          ],
        ),
        SizedBox(height: MARGIN_MEDIUM_2),
        AnimatedSize(
          duration: kAnimationDurationForFavourite,
          child: Container(
            height: isDescriptionShown ? null : 0.0,
            child: Text(
              "Lorem ipsum dolor sit amet. Et distinctio fuga aut maxime aperiam et Quis atque quo natus nemo eos aspernatur excepturi. Sit dolorum. Et suscipit praesentium quo minima sunt non ullam velit? Non velit",
              style: TextStyle(
                color: Color.fromRGBO(159, 159, 159, 1.0),
                height: 1.4,
                fontSize: TEXT_REGULAR_2X + 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DetailPageTitleView extends StatelessWidget {
  final String title;
  final bool isDescription;

  DetailPageTitleView({required this.title, this.isDescription = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: TEXT_REGULAR_3X,
            fontWeight: FontWeight.w500,
          ),
        ),
        (isDescription)
            ? Icon(
                Icons.arrow_drop_up,
                size: MARGIN_XLARGE + 10,
              )
            : Text(
                "Size Guide",
                style: TextStyle(
                  color: BLUE_DARK_COLOR,
                  fontSize: TEXT_REGULAR_2X,
                ),
              ),
      ],
    );
  }
}

class DressPriceSectionView extends StatelessWidget {
  const DressPriceSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "\$ 19,39",
          style: TextStyle(
            fontSize: TEXT_HEADING_2X,
            fontWeight: FontWeight.bold,
            color: BLUE_DARK_COLOR,
          ),
        ),
      ),
    );
  }
}

class DressNameSectionView extends StatelessWidget {
  const DressNameSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Modern Blue Jacket",
          style: TextStyle(
            fontSize: TEXT_BIG,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class OutfitIdeaTitleView extends StatelessWidget {
  const OutfitIdeaTitleView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "OUTFIT IDEAS",
        style: TextStyle(
          fontSize: TEXT_REGULAR_3X,
          color: Color.fromRGBO(159, 159, 159, 1.0),
        ),
      ),
    );
  }
}

class DetailPageSliverAppBar extends StatelessWidget {
  final Function onTap;

  DetailPageSliverAppBar({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blueAccent,
      automaticallyImplyLeading: false,
      expandedHeight: kSliverAppBarHeight,
      flexibleSpace: Stack(
        children: [
          FlexibleSpaceBar(
            background: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    "https://t3.ftcdn.net/jpg/01/86/11/86/360_F_186118623_aU4BBBH2zzkG7C1EdCAkSNHyNvvssznI.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      onTap();
                    },
                    child: BackButtonView(),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FavoriteAndShareIconView(),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: DotsIndicatorView(),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    MARGIN_XLARGE,
                  ),
                  topRight: Radius.circular(MARGIN_XLARGE),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DotsIndicatorView extends StatelessWidget {
  const DotsIndicatorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MARGIN_XLARGE + 3),
      child: DotsIndicator(
        dotsCount: 3,
        position: 0,
        decorator: DotsDecorator(
          color: Colors.grey,
          activeColor: Colors.white,
          size: const Size.square(MARGIN_CARD_MEDIUM_2),
          activeSize: const Size(MARGIN_LARGE, MARGIN_CARD_MEDIUM_2),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }
}

class FavoriteAndShareIconView extends StatelessWidget {
  const FavoriteAndShareIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: MARGIN_XXLARGE,
        right: MARGIN_LARGE,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ExplicitAnimationFavouriteButton(),
          SizedBox(width: MARGIN_MEDIUM_3),
          Icon(
            Icons.share,
            size: MARGIN_XLARGE,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

class BackButtonView extends StatelessWidget {
  const BackButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MARGIN_XXLARGE,
        left: MARGIN_LARGE,
      ),
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: MARGIN_XLARGE,
      ),
    );
  }
}
