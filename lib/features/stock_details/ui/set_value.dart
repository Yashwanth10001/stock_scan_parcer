import 'package:flutter/material.dart';
import 'package:stock_scan_parcer/utils/app_colors.dart';
import 'package:stock_scan_parcer/utils/text_styles.dart';

// ignore: must_be_immutable
class SetValue extends StatelessWidget {
  SetValue({required this.values,  super.key});

  List values = [];

  

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    TextEditingController textEditingController = TextEditingController(text: values[2].toString());
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 10),
            child: Container(
              height: screenHeight * 0.5,
              color: AppColors.primaryColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 12, left: 12),
                        child: Text(values[0].toString(), style: AppTextStyles.white60020,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Set Parameters', style: AppTextStyles.white60020),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Container(
                          height: 100,
                          color: AppColors.whiteColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(values[1], style: const TextStyle(fontSize: 18)),
                              ),
                              const SizedBox(width: 60),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: 200.0,
                                  height: 24,
                                  child: TextField(
                                    controller: textEditingController,
                                    decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.black), //<-- SEE HERE
                                      ),
                                    ),
                                    style: const TextStyle(fontSize: 18.0, height: 1.0, color: Colors.black),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                ],
              )
            )));
  }
}
