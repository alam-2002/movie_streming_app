import 'package:dartz/dartz.dart';
import 'package:movie_streaming_app/core/usecases/usecase.dart';
import 'package:movie_streaming_app/domain/tv/repositories/tv_repo.dart';
import 'package:movie_streaming_app/service_locator.dart';


class GetRecommendationTVsUseCase extends UseCase<Either, int> {

  @override
  Future<Either> call({int? params}) async {
    return await sl<TVRepository>().getRecommendationTVs(params ?? 0);
  }
}
