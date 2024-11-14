import 'package:dartz/dartz.dart';
import 'package:movie_streaming_app/core/usecases/usecase.dart';
import 'package:movie_streaming_app/data/auth/models/signin_req_params.dart';
import 'package:movie_streaming_app/domain/auth/repositories/auth_repo.dart';
import 'package:movie_streaming_app/service_locator.dart';

class SignInUseCase extends UseCase<Either, SignInReqParams> {

  @override
  Future<Either> call({SignInReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
}
