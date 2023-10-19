import 'package:flutter/material.dart';
import 'package:stock_scan_parcer/utils/app_colors.dart';
import 'package:stock_scan_parcer/utils/custom_divider.dart';
import 'package:stock_scan_parcer/utils/text_styles.dart';

// ignore: must_be_immutable
class SubDetails extends StatelessWidget {
  SubDetails({required this.values,  super.key});

  List values = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
            child: Container(
              height: 450,
              color: AppColors.primaryColor,
              child: ListView.builder(
                itemCount: values.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(values[index].toString(), style: AppTextStyles.white60020,),
                      ),
                      const CustomDivider(color: AppColors.whiteColor)
                    ],
                  );
                }
              ),
            )));
  }
}
