import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gdg_dev_fest/utils/devfest.dart';

part 'config_event.dart';
part 'config_state.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {

  static final ConfigBloc _configBlocSingleton = ConfigBloc._internal();

  factory ConfigBloc(){
    return _configBlocSingleton;
  }

  ConfigBloc._internal();

  bool darkModeOn = false;

  @override
  ConfigState get initialState => UnConfigState();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    try{
      yield UnConfigState();
      yield await event.applyAsync(currentState: state, bloc: this);
    }catch (_,stackTrace){
      print('$_ $stackTrace');
      yield state;
    }
  }
}
