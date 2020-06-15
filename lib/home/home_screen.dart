import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_dev_fest/home/bloc/home_bloc.dart';
import 'package:gdg_dev_fest/home/home_widget/home_front.dart';

class HomeScreen extends StatefulWidget {

  final HomeBloc _homeBloc;

  const HomeScreen({Key key,@required homeBloc}) : _homeBloc = homeBloc ,super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState(_homeBloc);
}

class _HomeScreenState extends State<HomeScreen> {

  final HomeBloc _homeBloc;

  _HomeScreenState(this._homeBloc);

  @override
  void initState() {
    super.initState();
    this._homeBloc.add(LoadHomeEvent());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc,HomeState>(
      bloc: widget._homeBloc,
      builder: (context,state){
        if(state is HomeInitial){
          return Center(child: CircularProgressIndicator());
        }else{
          return HomeFront();
        }
        
      },
    );
  }
}