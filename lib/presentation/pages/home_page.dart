import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:word_study_puzzle/common/constants/app_pages.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_home/home_bloc.dart';

import 'package:word_study_puzzle/common/constants/app_widget_keys.dart';
import 'package:word_study_puzzle/presentation/navigation.dart';
import 'package:word_study_puzzle/presentation/utils/flow_round_delegate.dart';
import 'package:word_study_puzzle/presentation/widgets/app_floating_action_buttons.dart';
import 'package:word_study_puzzle/presentation/widgets/app_row_material_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _flowAnimation;
  final double _flowButtonSize = 50;

  @override
  void initState() {
    super.initState();
    _flowAnimation = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _flowAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          //final SettingsBloc _bloc = BlocProvider.of<SettingsBloc>(context);
          return Scaffold(
              body: Stack(
                children: [
                  Stack(
                    children: [
                      _buildFlowButton(_buildIconActionMap(context)),
                    ],
                  ),
                  _buildMenuButton(),
                ],
              ));
        },
      ),
    );
  }

  Widget _buildFlowButton(Map<IconData, Function()> iconActionMap) {
    return Flow(
      key: const Key(CategoriesPageKeys.flowKey),
      delegate: FlowRoundDelegate(
        controller: _flowAnimation,
        buttonSize: _flowButtonSize,
        paddingOffset: const Offset(25, 40),
      ),
      children: iconActionMap.entries
          .map((e) => AppRowMaterialButton(
                callback: () {
                  e.value();
                  _runAnimationFlowButton();
                },
                buttonSize: _flowButtonSize,
                icon: e.key,
                iconSize: 25,
              ))
          .toList(),
    );
  }


  Widget _buildMenuButton() {
    return Positioned(
      right: 20,
      top: 40,
      child: AppFloatingActionButton(
        callback: _runAnimationFlowButton,
        animationController: _flowAnimation,
        animatedIcon: AnimatedIcons.menu_home,
      ),
    );
  }

  void _runAnimationFlowButton() {
    _flowAnimation.status == AnimationStatus.completed
        ? _flowAnimation.reverse()
        : _flowAnimation.forward();
  }

  Map<IconData, VoidCallback> _buildIconActionMap(BuildContext context) {
    return {
      Icons.room_preferences: () {
        Navigator.of(context)
            .push(Navigation.route(context, AppPages.settings));
      },
      Icons.manage_search: () {
        Navigator.of(context).push(Navigation.route(context, AppPages.words));
      },
      Icons.meeting_room: () {
        Navigator.of(context)
            .push(Navigation.route(context, AppPages.categories));
      },
    };
  }
}
