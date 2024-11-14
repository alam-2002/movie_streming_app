import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_streaming_app/presentation/search/bloc/selectable_cubit.dart';

class SearchFields extends StatelessWidget {
  const SearchFields({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: context.read<SearchCubit>().textCtrl,
      onChanged: (value) {
          context.read<SearchCubit>().search(
                value,
                context.read<SelectableCubit>().state,
              );
      },
      decoration: InputDecoration(
        hintText: 'Search..',
      ),
    );
  }
}
