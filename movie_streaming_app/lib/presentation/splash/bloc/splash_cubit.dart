import 'package:bloc/bloc.dart';
import 'package:movie_streaming_app/domain/auth/usecases/is_logged_in_usecase.dart';
import 'package:movie_streaming_app/presentation/splash/bloc/splash_states.dart';
import 'package:movie_streaming_app/service_locator.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(DisplaySplash());

  Future<void> appStarted() async {
    await Future.delayed(Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
