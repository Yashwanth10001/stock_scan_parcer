import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stock_scan_parcer/features/home/models/home_stock_data_model.dart';
import 'package:stock_scan_parcer/features/stock_details/bloc/stock_bloc.dart';
import 'package:stock_scan_parcer/features/stock_details/ui/set_value.dart';
import 'package:stock_scan_parcer/features/stock_details/ui/sub_details.dart';
import 'package:stock_scan_parcer/utils/text_styles.dart';

class FormattedText extends StatelessWidget {
  FormattedText({required this.criteria, required this.tag, super.key});

  final Criteria criteria;
  final String tag;

  final StockBloc stockBloc = StockBloc();

  @override
  Widget build(BuildContext context) {
    // stockBloc.getFormattedString(criteria);
    return RichText(
      text: TextSpan(
        // style: defaultStyle,
        children: getFormattedString(context)
      ),
    );
  }

  List<InlineSpan> getFormattedString(context) {
    List<InlineSpan> finalList = [];
    List<String> stringList = stockBloc.getFormattedString(criteria);
    for (var element in stringList) {
      if (element.contains('(')) {
        finalList.add(
          TextSpan(
              text: element,
              style: AppTextStyles.blue60020,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  if(stockBloc.checkData(criteria, element)) {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SetValue(values: stockBloc.getIndicatorData(criteria))));
                  } else {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SubDetails(values: stockBloc.getValuesData(criteria, tag))));
                  }
                    
                  
                    
                  
                  
                  // print('Terms of Service"');
                }),
        );
      } else {
        finalList.add(
          TextSpan(
              text: element,
              style: AppTextStyles.white60020,
              ),
        );
      }
    }

    return finalList;
  }
}
