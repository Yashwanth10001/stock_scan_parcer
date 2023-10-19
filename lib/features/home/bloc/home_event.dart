import 'package:flutter/cupertino.dart';

@immutable
abstract class HomeEvent {}

class HomeScreenClickedEvent extends HomeEvent {
}

class HomeInitialEvent extends HomeEvent {
  
}