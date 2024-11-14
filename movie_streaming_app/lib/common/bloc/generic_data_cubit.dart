import 'package:bloc/bloc.dart';
import 'package:movie_streaming_app/common/bloc/generic_data_state.dart';
import 'package:movie_streaming_app/core/usecases/usecase.dart';

class GenericDataCubit extends Cubit<GenericDataState> {
  GenericDataCubit() : super(DataLoading());

  void getData<T>(UseCase usecase,{dynamic params}) async {
    var returnedData = await usecase.call(params: params);
    returnedData.fold(
      (error) {
        emit(FailureData(errorMsg: error));
      },
      (data) {
        emit(DataLoaded<T>(data: data));
      },
    );
  }
}
