import 'package:flutter/cupertino.dart';
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
import 'package:word_study_puzzle/presentation/widgets/stats/stats_progress_card.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({Key? key}) : super(key: key);

  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  late StatsBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<StatsBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return BlocBuilder<StatsBloc, StatsState>(builder: (context, state) {
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
            alignment: Alignment.topCenter,
            children: [
              state.maybeWhen(initState: () {
                _bloc.add(InitExploredRate());
                _bloc.add(FetchHistoriesByMonths());
                return Container();
              }, loaded: (monthHistoryMap) {
                return Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Calendar(
                    historiesByMonths: monthHistoryMap,
                    currentDate: _bloc.currentDate,
                    initPage: _bloc.currentDate.month - 1,
                  ),
                );
              }, orElse: () {
                return Container();
              }),
              _buildBackButton(),
              isPortrait ? _buildLabel() : const SizedBox(),
              Positioned(
                  top: 40,
                  right: 20,
                  child: StatsProgressCard(dayExploredRate: _bloc.dayExploredRate,))
            ],
          ),
        ),
      );
    });
  }

  Widget _buildLabel() {
    return const Positioned(
        top: 50,
        child: AppTextBorder(
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

