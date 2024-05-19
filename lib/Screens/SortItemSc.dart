import 'package:apple_shop/Widgets/product_item.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:flutter/material.dart';

class SortScreen extends StatelessWidget {
  const SortScreen({super.key});

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
                      Image.asset('images/icon_apple_blue.png'),
                      Expanded(
                        child: Text(
                          'Sort Products',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Gb',
                              fontSize: 18,
                              color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return ProductItem();
                  }, childCount: 12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      childAspectRatio: 2 / 2.8,
                      mainAxisSpacing: 20)),
            )
          ],
        ),
      ),
    );
  }
}
