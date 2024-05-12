import 'package:flutter/material.dart';

class SortItem extends StatelessWidget {
  SortItem({super.key});

  List<String> Name = [
    'Categori 1',
    'Categori 2',
    'Categori 3',
    'Categori 4',
    'Categori 5',
    'Categori 6',
    'Categori 7',
    'Categori 8'
  ];
  List<Icon> icons = [
    Icon(
      Icons.safety_check_outlined,
      color: Colors.white,
    ),
    Icon(
      Icons.monochrome_photos_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.cabin_outlined,
      color: Colors.white,
    ),
    Icon(
      Icons.read_more_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.safety_check_outlined,
      color: Colors.white,
    ),
    Icon(
      Icons.monochrome_photos_rounded,
      color: Colors.white,
    ),
    Icon(
      Icons.cabin_outlined,
      color: Colors.white,
    ),
    Icon(
      Icons.read_more_rounded,
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
                children: [
                  Container(
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
                      child: icons[index]),
                  Text('${Name[index]}')
                ],
              ),
            );
          }),
    );
  }
}
