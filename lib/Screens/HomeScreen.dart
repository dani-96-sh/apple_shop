import 'package:apple_shop/Widgets/SortItems.dart';
import 'package:apple_shop/Widgets/banner_slider.dart';
import 'package:apple_shop/Widgets/product_item.dart';
import 'package:apple_shop/bloc/Home/HomeBloc.dart';
import 'package:apple_shop/bloc/Home/HomeEvents.dart';
import 'package:apple_shop/bloc/Home/HomeState.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:apple_shop/data/repository/BannerRepo.dart';
import 'package:apple_shop/utility/Api_Exception.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<Homebloc>(context).add(HomeinitilzedData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(child: BlocBuilder<Homebloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: <Widget>[
              if (state is HomeLoadingState) ...[
                SliverToBoxAdapter(
                  child: CircularProgressIndicator(),
                )
              ],
              if (state is HomeSuccessState) ...[
                state.bannerlist.fold((l) {
                  return SliverToBoxAdapter(
                    child: Text(''),
                  );
                }, (r) {
                  return BannerList(r);
                })
              ],
              SearchBox(),
              SortingItem(),
              Sorting(),
              Titles(),
              BestSeller(),
              BestSellersecound(),
              BestSellerthird(),
            ],
          );
        },
      )),
    );
  }

  SliverToBoxAdapter BestSellerthird() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: 12,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ProductItem(),
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter BestSellersecound() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Best selles',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Row(
              children: [
                Text('See More'),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.chevron_right_sharp)
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter BestSeller() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: 12,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ProductItem(),
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter SortingItem() {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            child: Text(
              'Sorting',
              style: TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter Titles() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Best selles',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Row(
              children: [
                Text('See More'),
                SizedBox(
                  width: 5,
                ),
                Icon(Icons.chevron_right_sharp)
              ],
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter Sorting() {
    return SliverToBoxAdapter(
      child: SortItem(),
    );
  }

  SliverToBoxAdapter SearchBox() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          width: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/icon_search.png'),
              Expanded(
                child: Text(
                  'Search for Products',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Gb', fontSize: 16, color: Colors.grey),
                ),
              ),
              Image.asset('images/icon_apple_blue.png'),
            ],
          ),
        ),
      ),
    );
  }

  SliverToBoxAdapter BannerList(Bannerlist) {
    return SliverToBoxAdapter(
      child: BannerSlider(
        bannerList: Bannerlist,
      ),
    );
  }
}
