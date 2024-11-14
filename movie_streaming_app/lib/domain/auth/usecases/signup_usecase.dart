import 'package:dartz/dartz.dart';
import 'package:movie_streaming_app/core/usecases/usecase.dart';
import 'package:movie_streaming_app/data/auth/models/signup_req_params.dart';
import 'package:movie_streaming_app/domain/auth/repositories/auth_repo.dart';
import 'package:movie_streaming_app/service_locator.dart';

class SignUpUseCase extends UseCase<Either, SignupReqParams> {

  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
