import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppblocState extends Equatable {
  AppblocState([List props = const []]) : super(props);
}

class InitialAppblocState extends AppblocState {}
