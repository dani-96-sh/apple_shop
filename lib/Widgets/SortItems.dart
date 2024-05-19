import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SortItem extends StatelessWidget {
  SortItem({super.key});

  List<String> Name = [
    'Iphone',
    'Mac',
    'Watch',
    'Display',
    'TV',
    'Mouse',
    'KeyBoard',
    'PlayStation'
  ];
  List<Icon> icons = [
    Icon(
      Icons.phone_iphone_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.laptop_mac_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.watch_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.monitor_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.tv,
      color: Colors.white,
    ),
    Icon(
      Icons.mouse,
      color: Colors.white,
    ),
    Icon(
      Icons.keyboard_alt_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.games_outlined,
      color: Colors.white,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Name.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Itemchip(index), Text('${Name[index]}')],
              ),
            );
          }),
    );
  }

  Itemchip(int index) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: 56,
        height: 56,
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
        child: icons[index]);
  }
}
