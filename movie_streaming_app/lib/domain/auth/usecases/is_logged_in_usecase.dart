import 'package:movie_streaming_app/core/usecases/usecase.dart';
import 'package:movie_streaming_app/domain/auth/repositories/auth_repo.dart';
import 'package:movie_streaming_app/service_locator.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {

  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
