import 'package:apple_shop/bloc/Category/CateEvents.dart';
import 'package:apple_shop/bloc/Category/CateState.dart';
import 'package:apple_shop/data/repository/categoryRepo.dart';
import 'package:apple_shop/di.dart';
import 'package:bloc/bloc.dart';

class CateBloc extends Bloc<CateEvents, CateState> {
  CateBloc() : super(CateInit()) {
    final IcategoryRepository _repository = locator.get();
    on<CategoryRequestList>(
      (event, emit) async {
        emit(CateLoading());
        var response = await _repository.getCategories();

        emit(CateResponse(response));
      },
    );
  }
}
