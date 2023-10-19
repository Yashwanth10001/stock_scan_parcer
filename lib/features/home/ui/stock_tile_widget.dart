import 'package:flutter/material.dart';
import 'package:stock_scan_parcer/features/home/models/home_stock_data_model.dart';
import 'package:stock_scan_parcer/utils/app_colors.dart';
import 'package:stock_scan_parcer/utils/custom_divider.dart';
import 'package:stock_scan_parcer/utils/text_styles.dart';

class StockTileWidget extends StatelessWidget {
  const StockTileWidget({super.key, required this.stockDataModel});

  final StockDataModel stockDataModel; 

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const Text("\u2022"),
            const SizedBox(width: 5),
            Flexible(
              child: Wrap(
                alignment: WrapAlignment.start,
                children: [
                  Text(stockDataModel.name, style: AppTextStyles.white60020),
                ],
              ),
            )
            
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(stockDataModel.tag,
              style: AppTextStyles.white40012
                  .copyWith(color: stockDataModel.color.contains('red') ? AppColors.redColor : stockDataModel.color.contains('green') ? AppColors.greenColor : AppColors.whiteColor)),
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomDivider(color: Colors.white)
      ],
    );
  }
}
