import 'package:apple_shop/widgets/SortItems.dart';
import 'package:apple_shop/widgets/banner_slider.dart';
import 'package:apple_shop/widgets/product_item.dart';
import 'package:apple_shop/bloc/Home/HomeBloc.dart';
import 'package:apple_shop/bloc/Home/HomeEvents.dart';
import 'package:apple_shop/bloc/Home/HomeState.dart';
import 'package:apple_shop/constant/color.dart';
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
                    child: Text('خطا'),
                  );
                }, (categorylist) {
                  return CategoryList(categorylist);
                })
              ],
              HotestProductTitle(),
              if (state is HomeSuccessState) ...[
                state.HotestProductList.fold((ifLeft) {
                  return SliverToBoxAdapter(child: Text(ifLeft));
                }, (productlist) {
                  return HotestProductItem(productlist);
                })
              ],
              BestSelleTitle(),
              if (state is HomeSuccessState) ...[
                state.GetBestSellerProduct.fold((ifLeft) {
                  return SliverToBoxAdapter(
                    child: Text(ifLeft),
                  );
                }, (BestSellProduct) {
                  return BestSelleProduct(BestSellProduct);
                })
              ]
            ],
          );
        },
      )),
    );
  }

  BestSelleProduct(BestSellProduct) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          itemCount: BestSellProduct.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ProductItem(product: BestSellProduct[index]),
            );
          },
        ),
      ),
    );
  }

  BestSelleTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.chevron_left_sharp),
                Text(
                  'بیشتر',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 18, fontFamily: 'Sh'),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            Text(
              'پرفروش ترین',
              style: TextStyle(
                  color: CustomColors.gery, fontSize: 18, fontFamily: 'Sh'),
            ),
          ],
        ),
      ),
    );
  }

  HotestProductItem(productlist) {
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

  SortingItemTitle() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'دسته بندی',
              style:
                  TextStyle(color: Colors.grey, fontFamily: 'Sh', fontSize: 18),
            ),
          )
        ],
      ),
    );
  }

  HotestProductTitle() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.chevron_left_sharp),
                Text(
                  'بیشتر',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 18, fontFamily: 'Sh'),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            Text(
              'داغ ترین ',
              style: TextStyle(
                  color: CustomColors.gery, fontSize: 18, fontFamily: 'Sh'),
            ),
          ],
        ),
      ),
    );
  }

  CategoryList(categorylist) {
    return SliverToBoxAdapter(
      child: SortItem(
        categorylist: categorylist,
      ),
    );
  }

  SearchBox() {
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

  BannerList(Bannerlist) {
    return SliverToBoxAdapter(
      child: BannerSlider(
        bannerList: Bannerlist,
      ),
    );
  }
}
