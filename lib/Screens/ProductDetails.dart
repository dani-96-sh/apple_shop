import 'dart:ui';
import 'package:apple_shop/constant/color.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.background,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  height: 46,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/icon_apple_blue.png'),
                      Expanded(
                        child: Text(
                          'Iphones',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Gb',
                              fontSize: 16,
                              color: CustomColors.blueindicator),
                        ),
                      ),
                      Image.asset('images/icon_back.png'),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 44, vertical: 12),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    'Iphone SE 2023',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontFamily: 'GB'),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 44, vertical: 12),
                child: Container(
                  height: 285,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('images/icon_star.png'),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '4.6',
                              style: TextStyle(fontSize: 15),
                            ),
                            Spacer(),
                            Image(
                                image: AssetImage(
                                    'images/icon_favorite_deactive.png'))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Image.asset('images/iphone.png'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 44),
                          child: ListView.builder(
                            itemCount: 3,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Image.asset('images/iphone.png'),
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 44),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text('Color Selection'),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          width: 23,
                          height: 23,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          width: 23,
                          height: 23,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          width: 23,
                          height: 23,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(4)),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text('Inner Memoristion '),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          width: 50,
                          height: 23,
                          child: Text(
                            '128',
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          width: 50,
                          height: 23,
                          child: Text(
                            '256',
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(6)),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          width: 50,
                          height: 23,
                          child: Text(
                            '1T',
                            textAlign: TextAlign.center,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 44, vertical: 15),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Information:',
                            style: TextStyle(fontFamily: 'GB'),
                          ),
                          Spacer(),
                          Text(
                            'See More',
                            style: TextStyle(color: CustomColors.blueindicator),
                          ),
                          Icon(Icons.arrow_right_rounded,
                              color: CustomColors.blueindicator)
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        children: [
                          Text(
                            'InfoProduct:',
                            style: TextStyle(fontFamily: 'GB'),
                          ),
                          Spacer(),
                          Text(
                            'See More',
                            style: TextStyle(color: CustomColors.blueindicator),
                          ),
                          Icon(Icons.arrow_right_rounded,
                              color: CustomColors.blueindicator)
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Text(
                            'Comments:',
                            style: TextStyle(fontFamily: 'GB'),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: 23,
                                height: 23,
                                decoration: BoxDecoration(
                                    color: Colors.yellow[800],
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              Positioned(
                                left: 10,
                                child: Container(
                                  width: 23,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Colors.green[500],
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                              Positioned(
                                left: 20,
                                child: Container(
                                  width: 23,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                              Positioned(
                                left: 30,
                                child: Container(
                                  width: 23,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Colors.pink,
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                              Positioned(
                                left: 40,
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      '7+',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  width: 23,
                                  height: 23,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Text(
                            'See More',
                            style: TextStyle(color: CustomColors.blueindicator),
                          ),
                          Icon(Icons.arrow_right_rounded,
                              color: CustomColors.blueindicator)
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: Colors.black)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(bottom: 12),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 140,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 12),
                            child: ClipRRect(
                              child: Container(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.attach_money_rounded,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          '1,200,000',
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                        Text(
                                          '1,000,000',
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: CustomColors.red),
                                      child: Text(
                                        '3%',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                                width: 160,
                                height: 53,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 140,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 12),
                            child: ClipRRect(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                        fontFamily: 'GB',
                                        fontSize: 17,
                                        color: Colors.white),
                                  ),
                                ),
                                width: 160,
                                height: 53,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
