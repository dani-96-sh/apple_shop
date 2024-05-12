import 'package:apple_shop/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class BannerSlider extends StatelessWidget {
  BannerSlider({super.key});

  PageController controller = PageController(viewportFraction: 1);
  int sliderCount = 5;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: 500,
          height: 200,
          child: PageView.builder(
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
