part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState {}

class SplashScreenInitial extends SplashScreenState {}

class Loading extends SplashScreenState {}

class Loaded extends SplashScreenState {}
