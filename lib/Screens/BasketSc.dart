import 'package:apple_shop/constant/color.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class BasketSC extends StatefulWidget {
  const BasketSC({super.key});

  @override
  State<BasketSC> createState() => _BasketSCState();
}

class _BasketSCState extends State<BasketSC> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.background,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 12),
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
                          Text(
                            'سبد خرید',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Sh',
                                fontSize: 18,
                                color: CustomColors.blueindicator),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return CartItem();
                  }, childCount: 4),
                ),
                SliverPadding(padding: EdgeInsets.only(bottom: 40))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontFamily: 'GB'),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 44, vertical: 12),
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Image.asset('images/iphone.png'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Iphone 13 ProMax 2dual',
                          style: TextStyle(fontFamily: 'GB'),
                        ),
                        Text(
                          '18 mounth warranty',
                          style: TextStyle(color: CustomColors.gery),
                        ),
                        Row(
                          children: [
                            Text('12,222\$'),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(6)),
                              child: Text(
                                '3%',
                                style: TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: DottedLine(
              lineThickness: 2.0,
              dashLength: 3.0,
              dashColor: CustomColors.blueindicator,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text('12,000'),
          )
        ],
      ),
    );
  }
}
