import 'package:equatable/equatable.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

abstract class TrailerState extends Equatable {}

class TrailerLoading extends TrailerState {
  @override
  List<Object?> get props => [];
}

class TrailerLoaded extends TrailerState {
  final YoutubePlayerController controller;
  TrailerLoaded({required this.controller});

  @override
  List<Object?> get props => [];
}

class FailureTrailer extends TrailerState {
  final String errorMsg;
  FailureTrailer({required this.errorMsg});

  @override
  List<Object?> get props => [errorMsg];
}
