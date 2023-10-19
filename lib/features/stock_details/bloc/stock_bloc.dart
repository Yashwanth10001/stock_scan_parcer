import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:stock_scan_parcer/features/home/bloc/home_event.dart';
import 'package:stock_scan_parcer/features/home/bloc/home_state.dart';
import 'package:stock_scan_parcer/features/home/models/home_stock_data_model.dart';
import 'package:stock_scan_parcer/features/stock_details/bloc/stock_event.dart';
import 'package:stock_scan_parcer/features/stock_details/bloc/stock_state.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  StockBloc() : super(StockInitial()) {
    on<StockInitialEvent>(stockInitialEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
  }

  FutureOr<void> stockInitialEvent(StockInitialEvent event, Emitter<StockState> emit) {
  }

  // List<int> dataValues = [];
  
  getFormattedString(Criteria criteria) {
    List<String> values = criteria.text.split('\$');
    // dataValues.clear();

    String finalString = criteria.text;
    
    for(int i=1; i<values.length; i++) {
      List<String> valuesTemp = values[i].split(' ');
      String val = "\$${valuesTemp[0]}";
      if(criteria.variable[val]!= null) {
        if(criteria.variable[val]['type'] != null && criteria.variable[val]['type'] == "value") {
          String modifiedString = finalString.replaceAll(val, '~(${criteria.variable[val]['values'][0]})~');
          finalString = modifiedString;
        } else if(criteria.variable[val]['type'] != null && criteria.variable[val]['type'] == "indicator") {
          String modifiedString = finalString.replaceAll(val, '~(${criteria.variable[val]['default_value']})~');
          finalString = modifiedString;
        }
      }
    }
    return finalString.split('~');
  }

  List<int> getValuesData(Criteria criteria) {
    List<int> dataValues = [];
    List<String> values = criteria.text.split('\$');
    dataValues.clear();

    String finalString = criteria.text;
    
    for(int i=1; i<values.length; i++) {
      List<String> valuesTemp = values[i].split(' ');
      String val = "\$${valuesTemp[0]}";
      if(criteria.variable[val]!= null) {
        if(criteria.variable[val]['type'] != null && criteria.variable[val]['type'] == "value") {
          String modifiedString = finalString.replaceAll(val, '~(${criteria.variable[val]['values'][0]})~');
          dataValues.addAll(criteria.variable[val]['values']);
          dataValues.sort((a, b) => b.compareTo(a));
          finalString = modifiedString;
        }
      }
    }
    
    return dataValues;
  }

  List<dynamic> getIndicatorData(Criteria criteria) {
    List<dynamic> indicatorData = [];

    List<String> values = criteria.text.split('\$');

    String finalString = criteria.text;
    
    for(int i=1; i<values.length; i++) {
      List<String> valuesTemp = values[i].split(' ');
      String val = "\$${valuesTemp[0]}";
      if(criteria.variable[val]!= null) {
        if(criteria.variable[val]['type'] != null && criteria.variable[val]['type'] == "indicator") {
          
          String modifiedString = finalString.replaceAll(val, '~(${criteria.variable[val]['default_value']})~');
          finalString = modifiedString;
          indicatorData.add(criteria.variable[val]['study_type']);
          indicatorData.add(criteria.variable[val]['parameter_name']);
          indicatorData.add(criteria.variable[val]['default_value']);
        }
      }
    }
    
    return indicatorData;
  }

  bool checkData(Criteria criteria, String val) {
    List<String> values = criteria.text.split('\$');
    String modifiedVal = val.replaceAll('(', '');
    modifiedVal = modifiedVal.replaceAll(')', '');
    
    for(int i=1; i<values.length; i++) {
      List<String> valuesTemp = values[i].split(' ');
      String val = "\$${valuesTemp[0]}";
      if(criteria.variable[val]!= null) {
        if(criteria.variable[val]['type'] != null && criteria.variable[val]['type'] == "indicator") {
          if(criteria.variable[val]['default_value'].toString().contains(modifiedVal)){
            return true;
            
          }
        }
      }
    }
    return false;
  }
}