import 'dart:ui';
import 'package:apple_shop/Screens/BasketSc.dart';
import 'package:apple_shop/Screens/ProductsSc.dart';
import 'package:apple_shop/Screens/ProfileScreen.dart';
import 'package:apple_shop/Widgets/product_item.dart';
import 'package:apple_shop/bloc/HomeBloc.dart';
import 'package:apple_shop/bloc/HomeEvents.dart';
import 'package:apple_shop/bloc/HomeState.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const newsc());
}

class newsc extends StatelessWidget {
  const newsc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => Homebloc(),
        child: MyScreen(),
      ),
    );
  }
}

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<Homebloc>(context).add(clickEvents());
                },
                child: Text('data')),
          ),
          BlocBuilder<Homebloc, HomeState>(
            builder: (context, state) {
              if (state is InitHome) {
                return Text('0');
              } else if (state is UpdateHome) {
                print('object');
                return Text('${state.x}');
              } else {
                return Text('error');
              }
            },
          )
        ],
      ),
    );
  }
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
                            image:
                                AssetImage('images/icon_category_active.png')),
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
                            image:
                                AssetImage('images/icon_profile_active.png')),
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
