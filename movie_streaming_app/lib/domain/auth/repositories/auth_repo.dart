import 'package:dartz/dartz.dart';
import 'package:movie_streaming_app/data/auth/models/signin_req_params.dart';
import 'package:movie_streaming_app/data/auth/models/signup_req_params.dart';

abstract class AuthRepository {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SignInReqParams params);
  Future<bool> isLoggedIn();
}
