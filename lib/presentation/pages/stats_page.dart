import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:word_study_puzzle/common/constants/app_widget_keys.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_stats/stats_bloc.dart';
import 'package:word_study_puzzle/presentation/widgets/app_floating_action_buttons.dart';
import 'package:word_study_puzzle/presentation/widgets/app_progress_indicator.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_border.dart';
import 'package:word_study_puzzle/presentation/widgets/snack_bar.dart';
import 'package:word_study_puzzle/presentation/widgets/stats/calendar.dart';
import 'package:word_study_puzzle/presentation/widgets/stats/stats_progress.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  late StatsBloc _bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsBloc, StatsState>(builder: (context, state) {
      _bloc = BlocProvider.of<StatsBloc>(context);
      return Scaffold(
        body: BlocListener<StatsBloc, StatsState>(
          listener: (context, state) {
            state.maybeWhen(
                error: (message) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(snackBar(title: message));
                },
                orElse: () {});
          },
          child: Stack(
            children: [
              state.maybeWhen(initState: () {
                _bloc.add(InitExploredRate());
                _bloc.add(FetchHistoriesByMonths());
                return Container();
              }, loaded: (monthHistoryMap) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 120,
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),),
                        margin: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            Expanded(child: StatsProgress(progressValue: _bloc.dayExploredRate, label: "Today",)),
                            Expanded(child: StatsProgress(progressValue: _bloc.categoryExploredRate, label: "Topic",)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.0 ),
                        child: Divider(thickness: 1,),
                      ),
                      Calendar(
                        historiesByMonths: monthHistoryMap,
                        currentDate: _bloc.currentDate,
                        initPage: _bloc.currentDate.month - 1,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                );
              }, orElse: () {
                return Container();
              }),
              _buildBackButton(),
              _buildLabel(),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLabel() {
    return Container(
        padding: const EdgeInsets.only(top: 50),
        alignment: Alignment.topCenter,
        child: const AppTextBorder(
          title: "Stats",
        ));
  }

  Widget _buildBackButton() {
    return Positioned(
      left: 20,
      top: 40,
      child: AppSmallFloatingActionButton(
        icon: Icons.arrow_back_ios_sharp,
        heroTag: CalendarPageKeys.backKey,
        callback: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
