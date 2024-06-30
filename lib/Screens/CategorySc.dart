import 'package:apple_shop/Widgets/cached_image.dart';
import 'package:apple_shop/bloc/Category/CateBloc.dart';
import 'package:apple_shop/bloc/Category/CateEvents.dart';
import 'package:apple_shop/bloc/Category/CateState.dart';
import 'package:apple_shop/constant/color.dart';
import 'package:apple_shop/model/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSc extends StatefulWidget {
  const CategoriesSc({super.key});

  @override
  State<CategoriesSc> createState() => _CategoriesScState();
}

class _CategoriesScState extends State<CategoriesSc> {
  List<CategoryModel>? list;

  @override
  void initState() {
    BlocProvider.of<CateBloc>(context).add(CategoryRequestList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            BlocBuilder<CateBloc, CateState>(
              builder: (context, state) {
                if (state is CateLoading) {
                  return SliverToBoxAdapter(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is CateResponse) {
                  return state.response.fold((ifLeft) {
                    return SliverToBoxAdapter(
                      child: Center(child: Text(ifLeft)),
                    );
                  }, (ifRight) {
                    return _ListCategory(list: ifRight);
                  });
                }
                return SliverToBoxAdapter(
                  child: Text('Error'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class _ListCategory extends StatelessWidget {
  List<CategoryModel>? list;
  _ListCategory({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      sliver: SliverGrid(
          delegate: SliverChildBuilderDelegate((context, index) {
            return CachedImage(imageUrl: list?[index].thumbnail);
          }, childCount: list?.length ?? 0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              childAspectRatio: 2 / 2.8,
              mainAxisSpacing: 20)),
    );
  }
}
