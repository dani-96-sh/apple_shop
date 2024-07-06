import 'package:apple_shop/Screens/ProductDetails.dart';
import 'package:apple_shop/bloc/Product/product_bloc.dart';
import 'package:apple_shop/widgets/cached_image.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:apple_shop/model/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductItem extends StatelessWidget {
  ProductItem({super.key, required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ProductBloc(),
            child: ProductDetails(),
          ),
        ));
      },
      child: Container(
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
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CachedImage(
                    imageUrl: product.thumbnail,
                  ),
                ),
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
                      '${product.persent!.round()} %',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      product.name,
                      maxLines: 1,
                      style: TextStyle(fontFamily: 'Sh', fontSize: 15),
                    ),
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
                            Text(
                              '${product.realprice}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Sh',
                                  fontSize: 16,
                                  decorationThickness: 1,
                                  decorationColor: Colors.white,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            Text(
                              '${product.price}',
                              style: TextStyle(
                                fontFamily: 'Sh',
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                            width: 24,
                            child: Image.asset(
                                'images/icon_right_arrow_cricle.png'))
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
