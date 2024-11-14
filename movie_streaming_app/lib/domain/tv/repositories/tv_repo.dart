import 'package:dartz/dartz.dart';

abstract class TVRepository {
  Future<Either> getPopularTV();
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getSimilarTVs(int tvId);
  Future<Either> getKeywordsTV(int tvId);
  Future<Either> searchTV(String query);
}