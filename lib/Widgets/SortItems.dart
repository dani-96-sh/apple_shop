import 'package:apple_shop/widgets/cached_image.dart';
import 'package:apple_shop/model/CategoryModel.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SortItem extends StatelessWidget {
  List<CategoryModel> categorylist;
  SortItem({super.key, required this.categorylist});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorylist.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ItemChip(
                  category: categorylist[index],
                ),
                Text(
                  '${categorylist[index].title ?? 'l'}',
                  style: TextStyle(fontFamily: 'Sh'),
                )
              ],
            );
          }),
    );
  }
}

class ItemChip extends StatelessWidget {
  final CategoryModel category;

  ItemChip({
    required this.category,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String categorycolor = 'ff${category.color}';
    int hexcolor = int.parse(categorycolor, radix: 16);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: 56,
      height: 56,
      decoration: ShapeDecoration(
        shadows: [
          BoxShadow(
              color: Color(hexcolor),
              spreadRadius: -12,
              blurRadius: 25,
              offset: Offset(0, 15))
        ],
        color: Color(hexcolor),
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Container(
          // padding: EdgeInsets.all(24),
          width: 12,
          height: 12,
          child: CachedImage(
            imageUrl: category.icon,
            boxFit: BoxFit.none,
          )),
    );
  }
}
