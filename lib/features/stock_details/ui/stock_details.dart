import 'package:flutter/material.dart';
import 'package:stock_scan_parcer/features/home/models/home_stock_data_model.dart';
import 'package:stock_scan_parcer/features/stock_details/bloc/stock_bloc.dart';
import 'package:stock_scan_parcer/features/stock_details/ui/formatted_text.dart';
import 'package:stock_scan_parcer/utils/app_colors.dart';
import 'package:stock_scan_parcer/utils/text_styles.dart';

class StockDetails extends StatefulWidget {
  StockDetails({required this.stockData, super.key});
  final StockDataModel stockData;

  final StockBloc stockBloc = StockBloc();

  @override
  State<StockDetails> createState() => _StockDetailsState();
}

class _StockDetailsState extends State<StockDetails> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
                child: Container(
                  height: 450,
                  color: AppColors.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 0, 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 100,
                          width: screenWidth * 0.87,
                          color: AppColors.blueColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Wrap(
                                  alignment: WrapAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(widget.stockData.name,
                                          style: AppTextStyles.white60020),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 12,
                                ),
                                child: Text(widget.stockData.tag,
                                    style: AppTextStyles.white40012
                                        .copyWith(color: widget.stockData.color.contains('red') ? AppColors.redColor : widget.stockData.color.contains('green') ? AppColors.greenColor : AppColors.whiteColor)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.stockData.criteria.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FormattedText(criteria: widget.stockData.criteria[index], tag: widget.stockData.tag),
                                  index < widget.stockData.criteria.length - 1
                                      ? const Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 8, top: 8),
                                          child: Text(
                                            'and',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.whiteColor),
                                          ),
                                        )
                                      : const SizedBox.shrink()
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
