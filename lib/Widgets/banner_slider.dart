import 'dart:async';

import 'package:apple_shop/widgets/cached_image.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:apple_shop/model/bannerModel.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerSlider extends StatefulWidget {
  List<BannerModel>? bannerList;

  BannerSlider({this.bannerList, super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  PageController controller =
      PageController(viewportFraction: 1, initialPage: 0);

  int sliderCount = 4;

  int _currentpage = 0;

  List<BannerModel>? bannerList;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        if (_currentpage < sliderCount) {
          _currentpage++;
        } else {
          _currentpage = 0;
        }
        controller.animateToPage(_currentpage,
            duration: Duration(milliseconds: 600), curve: Curves.ease);
      },
    );
    bannerList = widget.bannerList;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: 500,
          height: 200,
          child: PageView.builder(
              onPageChanged: (int index) {
                setState(() {
                  _currentpage = index;
                });
              },
              itemCount: bannerList!.length,
              controller: controller,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 20),
                    child: CachedImage(
                      boxFit: BoxFit.cover,
                      imageUrl: bannerList![index].thumbnail,
                    ));
              }),
        ),
        Positioned(
          bottom: 15,
          child: SmoothPageIndicator(
            controller: controller,
            effect: ExpandingDotsEffect(
                dotColor: Colors.white,
                dotWidth: 10,
                dotHeight: 10,
                activeDotColor: CustomColors.blueindicator),
            count: sliderCount,
          ),
        )
      ],
    );
  }
}
