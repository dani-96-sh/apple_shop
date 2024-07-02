import 'package:apple_shop/Widgets/SortItems.dart';
import 'package:apple_shop/Widgets/banner_slider.dart';
import 'package:apple_shop/Widgets/product_item.dart';
import 'package:apple_shop/bloc/Home/HomeBloc.dart';
import 'package:apple_shop/bloc/Home/HomeEvents.dart';
import 'package:apple_shop/bloc/Home/HomeState.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:apple_shop/model/ProductModel.dart';
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
                  child: SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator()),
                )
              ],
              SearchBox(),
              if (state is HomeSuccessState) ...[
                state.bannerlist.fold((l) {
                  return SliverToBoxAdapter(
                    child: Text(''),
                  );
                }, (r) {
                  return BannerList(r);
                })
              ],
              SortingItemTitle(),
              if (state is HomeSuccessState) ...[
                state.categoryList.fold((l) {
                  return SliverToBoxAdapter(
                    child: Text(''),
                  );
                }, (categorylist) {
                  return CategoryList(categorylist);
                })
              ],
              BestSellerItem(),
              if (state is HomeSuccessState) ...[
                state.productlist.fold((ifLeft) {
                  return SliverToBoxAdapter(child: Text(ifLeft));
                }, (productlist) {
                  return BestSellerProduct(productlist);
                })
              ],
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
              child: Text(''),
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

  SliverToBoxAdapter BestSellerProduct(productlist) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: productlist.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ProductItem(product: productlist[index]),
            );
          },
        ),
      ),
    );
  }

  SliverToBoxAdapter SortingItemTitle() {
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

  SliverToBoxAdapter BestSellerItem() {
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

  SliverToBoxAdapter CategoryList(categorylist) {
    return SliverToBoxAdapter(
      child: SortItem(
        categorylist: categorylist,
      ),
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
                  'بگرد و پیدا کن',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Sh',
                      fontSize: 18,
                      color: CustomColors.blueindicator),
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
