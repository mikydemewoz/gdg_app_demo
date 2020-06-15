part of 'config_bloc.dart';

abstract class ConfigState extends Equatable {
  const ConfigState();

  ConfigState getStateCopy();
}

class UnConfigState extends ConfigState {
  @override
  String toString() {
    return "UnConfigState";
  }

  @override
  List<Object> get props => [];

  @override
  ConfigState getStateCopy() {
    return UnConfigState();
  }
}

class InConfigState extends ConfigState {
  @override
  String toString() {
    return "InConfigState";
  }

  @override
  List<Object> get props => [];

  @override
  ConfigState getStateCopy() {
    return InConfigState();
  }
}

class ErrorConfigState extends ConfigState {

  final String errorMsg;

  ErrorConfigState(this.errorMsg);

  @override
  String toString() {
    return "ErrorConfigState";
  }

  @override
  List<Object> get props => [];

  @override
  ConfigState getStateCopy() {
    return ErrorConfigState(this.errorMsg);
  }
}