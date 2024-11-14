import 'package:equatable/equatable.dart';

abstract class GenericDataState extends Equatable {}

class DataLoading extends GenericDataState {
  @override
  List<Object?> get props => [];
}

class DataLoaded<T> extends GenericDataState {
  final T data;
  DataLoaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class FailureData extends GenericDataState {
  final String errorMsg;
  FailureData({required this.errorMsg});

  @override
  List<Object?> get props => [errorMsg];
}
