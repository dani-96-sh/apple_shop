import 'package:apple_shop/Widgets/SortItems.dart';
import 'package:apple_shop/Widgets/banner_slider.dart';
import 'package:apple_shop/constant/color.dart';
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
        appBar: AppBar(
          centerTitle: true,
          title: Text(''),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [BannerSlider(), SortItem()],
        ));
  }
}
