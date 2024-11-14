import 'package:movie_streaming_app/core/global_entities/keyword_entity.dart';
import 'package:movie_streaming_app/core/global_models/keyword_model.dart';

class KeywordMapper {

  static KeywordEntity toEntity(KeywordModel keywordModel) {
    return KeywordEntity(
      name: keywordModel.name,
      id: keywordModel.id
    );
  }
}