import 'package:dartz/dartz.dart';
import 'package:movie_streaming_app/core/usecases/usecase.dart';
import 'package:movie_streaming_app/domain/tv/repositories/tv_repo.dart';
import 'package:movie_streaming_app/service_locator.dart';

class GetPopularTVUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TVRepository>().getPopularTV();
  }
}
