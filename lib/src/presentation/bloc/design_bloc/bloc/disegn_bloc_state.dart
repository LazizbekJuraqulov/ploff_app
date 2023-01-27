part of 'disegn_bloc_bloc.dart';

abstract class DisegnBlocState extends Equatable {
  const DisegnBlocState();
  
  @override
  List<Object> get props => [];
}

class DisegnBlocInitial extends DisegnBlocState {}
