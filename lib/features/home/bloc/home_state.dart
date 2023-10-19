
import 'package:flutter/cupertino.dart';
import 'package:stock_scan_parcer/features/home/models/home_stock_data_model.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeLoadSuccessState extends HomeState {
  final List<StockDataModel> stockDetails;

  HomeLoadSuccessState({required this.stockDetails});
}

class NavigateToDetailsState extends HomeActionState {}