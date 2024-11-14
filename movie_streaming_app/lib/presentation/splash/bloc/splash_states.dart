import 'package:equatable/equatable.dart';

abstract class SplashStates extends Equatable {}

class DisplaySplash extends SplashStates {
  @override
  List<Object?> get props => [];
}

class Authenticated extends SplashStates {
  @override
  List<Object?> get props => [];
}

class UnAuthenticated extends SplashStates {
  @override
  List<Object?> get props => [];
}
