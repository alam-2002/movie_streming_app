import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/common/bloc/generic_data_cubit.dart';
import 'package:movie_streaming_app/common/bloc/generic_data_state.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';
import 'package:movie_streaming_app/common/widgets/tv_card.dart';
import 'package:movie_streaming_app/domain/tv/entities/tv_entity.dart';
import 'package:movie_streaming_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_streaming_app/service_locator.dart';

class PopularTV extends StatelessWidget {
  const PopularTV({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData<List<TVEntity>>(sl<GetPopularTVUseCase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          print(state);
          // Loading State
          if (state is DataLoading) {
            return Center(child: CircularProgressIndicator());
          }
          // Loaded State
          if (state is DataLoaded) {
            return SizedBox(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: state.data.length,
                padding: EdgeInsets.symmetric(horizontal: 15),
                itemBuilder: (context, index) {
                  return TVCard(tvEntity: state.data[index]);
                },
              ),
            );
          }
          // Error State
          if (state is FailureData) {
            return Center(child: Label(label: state.errorMsg));
          }
          // Default
          return Container();
        },
      ),
    );
  }
}
