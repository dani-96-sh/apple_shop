import 'package:flutter/material.dart';

class ItemChip extends StatelessWidget {
  const ItemChip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: 60,
        height: 60,
        decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
                color: Colors.red,
                spreadRadius: -12,
                blurRadius: 25,
                offset: Offset(0, 15))
          ],
          color: Colors.red,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Icon(
          Icons.help_outline,
          color: Colors.white,
        ));
  }
}
