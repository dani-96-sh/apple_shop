import 'package:apple_shop/widgets/itemchip.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
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
                    Expanded(
                      child: Text(
                        'پروفایل',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Sh',
                            fontSize: 18,
                            color: CustomColors.blueindicator),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Danial Shahangi',
              style: TextStyle(fontFamily: 'GB', fontSize: 16),
            ),
            Text(
              '09130801398',
              style:
                  TextStyle(fontFamily: 'GM', fontSize: 12, letterSpacing: 5),
            ),
            SizedBox(
              height: 30,
            ),
            Wrap(
              spacing: 20,
              runAlignment: WrapAlignment.end,
              runSpacing: 30,
              children: [
                ItemChip(),
                ItemChip(),
                ItemChip(),
                ItemChip(),
                ItemChip(),
                ItemChip(),
                ItemChip(),
                ItemChip(),
                ItemChip(),
              ],
            ),
            Spacer(),
            Text(
              'Apple Shop',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'V-1.0.0',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              'Flutter Devloper',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 12,
            )
          ],
        ),
      ),
    );
  }
}
