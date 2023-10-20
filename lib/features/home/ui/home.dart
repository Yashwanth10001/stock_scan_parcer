import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_scan_parcer/features/home/bloc/home_bloc.dart';
import 'package:stock_scan_parcer/features/home/bloc/home_event.dart';
import 'package:stock_scan_parcer/features/home/bloc/home_state.dart';
import 'package:stock_scan_parcer/features/home/ui/stock_tile_widget.dart';
import 'package:stock_scan_parcer/features/stock_details/ui/stock_details.dart';
import 'package:stock_scan_parcer/utils/app_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is !HomeActionState,
      listener: (context, state) {},
      builder: (context, state) {

        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadSuccessState:
          final successState = state as HomeLoadSuccessState;
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 50, horizontal: 10),
                        child: Container(
                          color: AppColors.primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 30, 10, 40),
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: successState.stockDetails.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    homeBloc.add(HomeScreenClickedEvent());
                                    // if(state is NavigateToDetailsState) {

          Navigator.push(context, MaterialPageRoute(builder: (context) => StockDetails(stockData: successState.stockDetails[index])));
        // }
                                    
                                  },
                                  child: StockTileWidget(stockDataModel: successState.stockDetails[index])
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          case HomeErrorState:
            return const Scaffold(body: Center(child: Text("Error"),));
          default: 
            return const SizedBox();
        }
      },
    );
  }
}
