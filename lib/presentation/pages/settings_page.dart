import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_settings/settings_bloc.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_settings/settings_event.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_settings/settings_state.dart';

import '../../common/constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          //BlocProvider.of<SettingsBloc>(context).add(LoadLightTheme());
          //final SettingsBloc _bloc = BlocProvider.of<SettingsBloc>(context);
          Themes currentTheme = BlocProvider.of<SettingsBloc>(context).theme;
          print(BlocProvider.of<SettingsBloc>(context).theme.toString());
          state.when(
            initState: () {},
            content: (theme) {
              print('content');
            },
          );
          return _mainContainer(theme: currentTheme);
        },
      ),
    );
  }

  Scaffold _mainContainer({Themes? theme}) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox.expand(
            child: BlocBuilder<SettingsBloc, SettingsState>(
                builder: (context, state) {
              //print(theme.toString());
              return Container(
                  color: theme == null
                      ? Colors.white
                      : theme == Themes.light
                          ? Colors.white
                          : Colors.black87,
                  child: Column(
                    children: [
                      Text('Settings'),
                      OutlinedButton(
                          onPressed: () {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(LoadDarkTheme());
                          },
                          child: Text(
                            "Dark",
                            style: TextStyle(color: Colors.green),
                          )),
                      OutlinedButton(
                          onPressed: () {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(LoadLightTheme());
                          },
                          child: Text(
                            "Light",
                            style: TextStyle(color: Colors.green),
                          )),
                    ],
                  ));
            })));
  }
}
