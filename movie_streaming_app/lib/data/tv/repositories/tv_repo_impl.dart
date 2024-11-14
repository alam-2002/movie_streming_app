import 'package:dartz/dartz.dart';
import 'package:movie_streaming_app/common/helper/mapper/keyword_mapper.dart';
import 'package:movie_streaming_app/common/helper/mapper/tv_mapper.dart';
import 'package:movie_streaming_app/core/global_models/keyword_model.dart';
import 'package:movie_streaming_app/data/tv/models/tv_model.dart';
import 'package:movie_streaming_app/data/tv/sources/tv_api_service.dart';
import 'package:movie_streaming_app/domain/tv/repositories/tv_repo.dart';
import 'package:movie_streaming_app/service_locator.dart';

class TVRepositoryImpl extends TVRepository {
  @override
  Future<Either> getPopularTV() async {
    var returnedData = await sl<TVService>().getPopularTV();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async {
    var returnedData = await sl<TVService>().getRecommendationTVs(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async {
    var returnedData = await sl<TVService>().getSimilarTVs(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => TVMapper.toEntity(TVModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> getKeywordsTV(int tvId) async {
    var returnedData = await sl<TVService>().getKeywordsTV(tvId);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        var movies = List.from(data['content']).map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }

  @override
  Future<Either> searchTV(String query) async{
    var returnedData = await sl<TVService>().searchTV(query);

    return returnedData.fold(
          (error) {
        return Left(error);
      },
          (data) {
        var movies = List.from(data['content']).map((item) => KeywordMapper.toEntity(KeywordModel.fromJson(item))).toList();
        return Right(movies);
      },
    );
  }
}
