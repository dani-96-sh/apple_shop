import 'package:apple_shop/bloc/Product/productEvents.dart';
import 'package:apple_shop/bloc/Product/productState.dart';
import 'package:apple_shop/data/repository/ImageProductRepo.dart';
import 'package:apple_shop/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvents, Productstate> {
  final IDetailsProductRepository _repository = locator.get();
  ProductBloc() : super(InitProductState()) {
    on<GetGalleryEvent>((event, emit) async {
      emit(LoadingProductState());
      var response = await _repository.GetGallery();
      emit(SuccessProductState(response));
    });
  }
}
