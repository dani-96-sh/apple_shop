import 'package:apple_shop/bloc/HomeEvents.dart';
import 'package:apple_shop/bloc/HomeState.dart';
import 'package:bloc/bloc.dart';

class Homebloc extends Bloc<HomeEvents, HomeState> {
  Homebloc() : super(InitHome()) {
    on<clickEvents>((event, emit) {
      emit(UpdateHome(12));
    });
  }
}
