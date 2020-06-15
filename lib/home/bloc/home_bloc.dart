import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();

  factory HomeBloc(){
    return _homeBlocSingleton;
  }

  @override
  HomeState get initialState => HomeInitial();

  HomeBloc._internal();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try{
      yield HomeInitial();
      yield await event.applyAsync(currentState: state, bloc: this);
    }catch (_,stackTrace){
      print('$_ $stackTrace');
      yield state;
    }
  }
}
