import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stock_scan_parcer/data/stock_data.dart';
import 'package:stock_scan_parcer/features/home/bloc/home_event.dart';
import 'package:stock_scan_parcer/features/home/bloc/home_state.dart';
import 'package:stock_scan_parcer/features/home/models/home_stock_data_model.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeScreenClickedEvent>(homeScreenClickedEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    
    emit(HomeLoadingState());
    emit(HomeLoadSuccessState(stockDetails: StockData.stockItems.map((e) => 
    StockDataModel(id: e['id'], name: e['name'], tag: e['tag'], color: e['color'], criteria: List.from(e['criteria'] ?? [])
        .map((e) => Criteria.fromJson(e))
        .toList())
    ).toList()));
  }

  FutureOr<void> homeScreenClickedEvent(HomeScreenClickedEvent event, Emitter<HomeState> emit) {
    emit(NavigateToDetailsState());
  }
}