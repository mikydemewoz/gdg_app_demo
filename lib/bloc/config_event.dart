part of 'config_bloc.dart';

abstract class ConfigEvent extends Equatable {
  const ConfigEvent();

  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

class DarkModeEvent extends ConfigEvent {

  final bool darkOn;

  DarkModeEvent(this.darkOn);

  @override
  String toString() {
    return 'DarkModeEvent';
  }

  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async{
    try{
      bloc.darkModeOn = darkOn;
      Devfest.prefs.setBool(Devfest.darkModePref,darkOn);
      return InConfigState();
    }catch(_,stackTrace){
      return ErrorConfigState(_?.toString());
    }
    
  }

  @override
  List<Object> get props => throw UnimplementedError();
}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() {
    return 'LoadConfigEvent';
  }

  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async{
    try{
      await Future.delayed(Duration(seconds: 2));
      return InConfigState();
    }catch(_,stackTrace){
      return ErrorConfigState(_?.toString());
    }
    
  }

  @override
  List<Object> get props => throw UnimplementedError();
}
