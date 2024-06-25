import 'package:apple_shop/bloc/Authentication/AuthEvent.dart';
import 'package:apple_shop/bloc/Authentication/AuthState.dart';
import 'package:apple_shop/data/repository/Authentication_repository.dart';
import 'package:apple_shop/di.dart';
import 'package:bloc/bloc.dart';

class Authbloc extends Bloc<AuthEvents, Authstate> {
  final IAuthRepository _repository = locator.get();
  Authbloc() : super(AuthInitState()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthloadingState());
      var response = await _repository.login(event.username, event.password);
      emit(AuthResponseState(response));
    });
  }
}
