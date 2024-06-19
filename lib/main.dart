import 'dart:ui';
import 'package:apple_shop/Screens/BasketSc.dart';
import 'package:apple_shop/Screens/ProductsSc.dart';
import 'package:apple_shop/Screens/ProfileScreen.dart';
import 'package:apple_shop/Widgets/product_item.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:apple_shop/data/repository/Authentication_repository.dart';
import 'package:apple_shop/data/source/Athentication.dart';
import 'package:apple_shop/di.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(const MainPage());
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'GM'),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  var either = await AuthenticationRepository()
                      .login('first', '11111111');
                  var shared = locator.get<SharedPreferences>();
                  print(shared.getString('acces_token'));
                  // either.fold((errormessage) {
                  //   print(errormessage);
                  // }, (successmessage) {
                  //   print(successmessage);
                  // });
                },
                child: Text('GetData'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Scaffold mainScafold() {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: BottomNavigationBar(
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: CustomColors.blueindicator,
              selectedLabelStyle: TextStyle(fontFamily: 'GB', fontSize: 14),
              elevation: 0,
              onTap: (value) {
                setState(() {
                  _selectedItem = value;
                });
              },
              currentIndex: _selectedItem,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_home.png'),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: CustomColors.blueindicator,
                            blurRadius: 20,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13))
                      ]),
                      child: Image(
                          image: AssetImage('images/icon_home_active.png')),
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image(
                    image: AssetImage('images/icon_basket.png'),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: CustomColors.blueindicator,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13))
                      ]),
                      child: Image(
                          image: AssetImage('images/icon_basket_active.png')),
                    ),
                  ),
                  label: 'Basket',
                ),
                BottomNavigationBarItem(
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 20,
                          color: CustomColors.blueindicator,
                          spreadRadius: -7,
                          offset: Offset(0.0, 13),
                        )
                      ]),
                      child: Image(
                          image: AssetImage('images/icon_category_active.png')),
                    ),
                  ),
                  icon: Image.asset('images/icon_category.png'),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_profile.png'),
                  label: 'Profile',
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: CustomColors.blueindicator,
                            spreadRadius: -7,
                            offset: Offset(0.0, 13))
                      ]),
                      child: Image(
                          image: AssetImage('images/icon_profile_active.png')),
                    ),
                  ),
                )
              ]),
        ),
      ),
      body: IndexedStack(
        index: _selectedItem,
        children: GetPages,
      ),
    );
  }

  List<Widget> GetPages = [
    ProductSc(),
    BasketSC(),
    ProductItem(),
    ProfileScreen()
  ];
}
