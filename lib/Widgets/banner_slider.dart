import 'dart:async';

import 'package:apple_shop/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class BannerSlider extends StatefulWidget {
  BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  PageController controller =
      PageController(viewportFraction: 1, initialPage: 0);

  int sliderCount = 5;

  int _currentpage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentpage < sliderCount) {
        _currentpage++;
      } else {
        _currentpage = 0;
      }
      controller.animateToPage(_currentpage,
          duration: Duration(milliseconds: 600), curve: Curves.ease);
    });
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
              itemCount: sliderCount,
              controller: controller,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Container(
                    margin: EdgeInsets.all(8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(15)),
                  ),
                );
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
