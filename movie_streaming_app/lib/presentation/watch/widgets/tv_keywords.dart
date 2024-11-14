import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/common/bloc/generic_data_cubit.dart';
import 'package:movie_streaming_app/common/bloc/generic_data_state.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';
import 'package:movie_streaming_app/core/global_entities/keyword_entity.dart';
import 'package:movie_streaming_app/domain/tv/usecases/get_keywords.dart';
import 'package:movie_streaming_app/service_locator.dart';

class TVKeywords extends StatelessWidget {
  final int tvId;
  const TVKeywords({
    super.key,
    required this.tvId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => GenericDataCubit()..getData<List<KeywordEntity>>(sl<GetTVKeywordsUseCase>(), params: tvId),
        child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is DataLoaded) {
              List<KeywordEntity> keyword = state.data;
              return Wrap(
                spacing: 5,
                children: keyword
                    .map(
                      (item) => Chip(
                        label: Label(
                          label: item.name!,
                          fontSize: 14,
                        ),
                      ),
                    )
                    .toList(),
              );
            }

            if (state is FailureData) {
              return Text(state.errorMsg);
            }

            return Container();
          },
        ));
  }
}
