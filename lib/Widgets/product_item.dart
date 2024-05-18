import 'package:apple_shop/constant/color.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      width: 160,
      height: 216,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Expanded(child: Container()),
              Image.asset('images/iphone.png'),
              Positioned(
                  top: 0,
                  right: 10,
                  child: Image.asset('images/active_fav_product.png')),
              Positioned(
                bottom: 0,
                left: 5,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: CustomColors.red),
                  child: Text(
                    '3%',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: const Text(
                  'iphone 13 pro max',
                  style: TextStyle(fontFamily: 'Gm', fontSize: 14),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 53,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: CustomColors.blueindicator,
                          blurRadius: 25,
                          spreadRadius: -12,
                          offset: Offset(0.0, 12))
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                    color: CustomColors.blueindicator),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.attach_money_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '1,200,000',
                            style: TextStyle(
                                color: Colors.white,
                                decorationThickness: 2,
                                decorationColor: Colors.white,
                                decoration: TextDecoration.lineThrough),
                          ),
                          const Text(
                            '1,000,000',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                          width: 24,
                          child:
                              Image.asset('images/icon_right_arrow_cricle.png'))
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
