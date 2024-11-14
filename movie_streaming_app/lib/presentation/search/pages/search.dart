import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_streaming_app/common/widgets/app_bar.dart';
import 'package:movie_streaming_app/common/widgets/text_widget.dart';
import 'package:movie_streaming_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_streaming_app/presentation/search/bloc/selectable_cubit.dart';
import 'package:movie_streaming_app/presentation/search/widgets/search_content.dart';
import 'package:movie_streaming_app/presentation/search/widgets/search_fields.dart';
import 'package:movie_streaming_app/presentation/search/widgets/search_options.dart';
import 'package:movie_streaming_app/presentation/search/widgets/selectable_option.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        title: Label(label: 'Search'),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectableCubit()),
          BlocProvider(create: (context) => SearchCubit()),
        ],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SearchFields(),
              SizedBox(height: 15),
              SearchOptions(),
              SizedBox(height: 15),
              Expanded(child: SearchContent()),
            ],
          ),
        ),
      ),
    );
  }
}
