import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_streaming_app/presentation/search/bloc/selectable_cubit.dart';
import 'package:movie_streaming_app/presentation/search/widgets/selectable_option.dart';

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectableCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOption(
              title: 'Movie',
              isSelected: context.read<SelectableCubit>().state == SearchType.movie,
              onTap: () {
                context.read<SelectableCubit>().selectMovie;
                context.read<SearchCubit>().search(
                      context.read<SearchCubit>().textCtrl.text,
                      context.read<SelectableCubit>().state,
                    );
              },
            ),
            SizedBox(width: 15),
            SelectableOption(
              title: 'TV',
              isSelected: context.read<SelectableCubit>().state == SearchType.tv,
              onTap: () {
                context.read<SelectableCubit>().selectTV();
                context.read<SearchCubit>().search(
                  context.read<SearchCubit>().textCtrl.text,
                  context.read<SelectableCubit>().state,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
