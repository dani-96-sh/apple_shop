import 'package:apple_shop/Widgets/SortItems.dart';
import 'package:apple_shop/Widgets/banner_slider.dart';
import 'package:apple_shop/Widgets/product_item.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:apple_shop/test/test.dart';

import 'package:flutter/material.dart';

class ProductSc extends StatefulWidget {
  const ProductSc({super.key});

  @override
  State<ProductSc> createState() => _ProductScState();
}

class _ProductScState extends State<ProductSc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: CustomScrollView(
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
                  width: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/icon_search.png'),
                      Expanded(
                        child: Text(
                          'Search for Products',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Gb',
                              fontSize: 16,
                              color: Colors.grey),
                        ),
                      ),
                      Image.asset('images/icon_apple_blue.png'),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BannerSlider(),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                    child: Text(
                      'Sorting',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SortItem(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best selles',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text('See More'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.chevron_right_sharp)
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 12,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ProductItem(),
                    );
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Best selles',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text('See More'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(Icons.chevron_right_sharp)
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: 12,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: ProductItem(),
                    );
                  },
                ),
              ),
            ),
            // SliverToBoxAdapter(
            //   child: ElevatedButton(
            //     child: Text('data'),
            //     onPressed: () {
            //       var either = sendData(2);
            //       either.fold((errorMassage) {
            //         return print(errorMassage);
            //       }, (response) {
            //         return print(response);
            //       });
            //     },
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
