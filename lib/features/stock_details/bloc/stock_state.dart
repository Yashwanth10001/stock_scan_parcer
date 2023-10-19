import 'package:flutter/cupertino.dart';

@immutable
abstract class StockState {}

abstract class StockActionState extends StockState {}

class StockInitial extends StockState {}