import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class AppblocBloc extends Bloc<AppblocEvent, AppblocState> {
  @override
  AppblocState get initialState => InitialAppblocState();

  @override
  Stream<AppblocState> mapEventToState(
    AppblocEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
