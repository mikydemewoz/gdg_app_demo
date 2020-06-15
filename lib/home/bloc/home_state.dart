part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  HomeState getStateCopy();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];

  @override
  HomeState getStateCopy() {
    return HomeInitial();
  }
}

class InHomeState extends HomeState{
  @override
  HomeState getStateCopy() {
    return InHomeState();
  }

  @override
  List<Object> get props => throw UnimplementedError();

}

class ErrorHomeState extends HomeState{
  final String errorMsg;

  ErrorHomeState(this.errorMsg);

  @override
  String toString() {
    return "ErrorConfigState";
  }

  @override
  List<Object> get props => [];

  @override
  ErrorHomeState getStateCopy() {
    return ErrorHomeState(this.errorMsg);
  }

}