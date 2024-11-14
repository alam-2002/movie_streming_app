
import 'package:bloc/bloc.dart';

enum SearchType {movie,tv}

class SelectableCubit extends Cubit<SearchType>{
  SelectableCubit() : super(SearchType.movie);

  void selectMovie() => emit(SearchType.movie);
  void selectTV() => emit(SearchType.tv);
}