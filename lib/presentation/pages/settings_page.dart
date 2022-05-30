import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/common/constants/app_titles.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_settings/settings_bloc.dart';
import 'package:word_study_puzzle/presentation/utils/hero_dialog_route.dart';
import 'package:word_study_puzzle/presentation/widgets/global/global.dart';
import 'package:word_study_puzzle/presentation/widgets/settings/settings.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsBloc _bloc;

  @override
  void initState() {
    _bloc = BlocProvider.of<SettingsBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        _bloc = BlocProvider.of<SettingsBloc>(context);
        return Scaffold(
          body: BlocListener<SettingsBloc, SettingsState>(
            listener: (context, state) {
              state.maybeWhen(
                  error: (message) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(snackBar(title: message));
                  },
                  orElse: () {});
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                state.maybeWhen(initState: () {
                  _bloc.add(FetchSettings());
                  return Container();
                }, loaded: (settings) {
                  bool isPortrait =
                      MediaQuery.of(context).orientation == Orientation.portrait;
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 100, right: 20, left: 20),
                      child: GridView.count(
                          crossAxisCount: isPortrait ? 2 : 4,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            SettingsViewItem(
                              callback: _showWordCountDialog,
                              title: AppTitles.dailyWords,
                              icon: Icons.track_changes,
                              tag: AppTags.heroChangeWordCount,
                            ),
                            SettingsViewItem(
                              callback: settings.isNotification
                                  ? _turnOffNotification
                                  : _showNotificationDialog,
                              title: AppTitles.notification,
                              icon: settings.isNotification
                                  ? Icons.notifications_active_outlined
                                  : Icons.notifications_none_outlined,
                              tag: AppTags.heroChangeNotification,
                            ),
                            SettingsViewItem(
                              callback: _changeTheme,
                              title: AppTitles.theme,
                              icon: settings.darkThemeIsEnabled
                                  ? Icons.nights_stay
                                  : Icons.light_mode,
                              tag: AppTags.heroChangeTheme,
                            ),
                            SettingsViewItem(
                              callback: _changeVibration,
                              title: AppTitles.vibration,
                              icon: settings.isVibration
                                  ? Icons.vibration
                                  : Icons.smartphone,
                              tag: AppTags.heroChangeVibration,
                            ),
                            SettingsViewItem(
                              callback: _changeViewMode,
                              title: AppTitles.viewMode,
                              icon: settings.viewCarouselIsEnabled
                                  ? Icons.view_carousel
                                  : Icons.style,
                              tag: AppTags.heroViewMode,
                            ),
                            SettingsViewItem(
                              callback: _shareLink,
                              title: AppTitles.share,
                              icon: Icons.share,
                              tag: AppTags.heroShareLink,
                            ),

                          ]),
                    ),
                  );
                }, orElse: () {
                  return Container();
                }),
                _buildBackButton(),
                _buildInfoButton(),
                _buildLabel(),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showWordCountDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return WordCountDialog(
            wordCount: _bloc.settings.wordToExploreCount,
            callback: (int count) {
              _bloc.add(ChangeWordCount(count));
            },
            title: AppTitles.wordCount,
          );
        });
  }

  void _showNotificationDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return NotificationDialog(
            callback: (String time) {
              _bloc.add(ChangeNotification(true, time));
              _bloc.add(FetchSettings());
            },
            title: AppTitles.timeNotification,
            timeNotification: _bloc.settings.timeNotification,
            isNotification: _bloc.settings.isNotification,
          );
        });
  }

  void _turnOffNotification() {
    _bloc.add(ChangeNotification(false, _bloc.settings.timeNotification));
    _bloc.add(FetchSettings());
  }

  void _showVersionPopupCard() {
    Navigator.of(context).push(
      HeroDialogRoute(
        builder: (context) => const Center(
          child: VersionPopupCard(
            title: AppTitles.appVersion,
          ),
        ),
      ),
    );
  }

  void _shareLink() {
    Share.share(AppTitles.linkShare, subject: AppTitles.subjectShare);
  }

  void _changeTheme() {
    if (_bloc.settings.darkThemeIsEnabled) {
      _bloc.add(ChangeTheme(false));
    } else {
      _bloc.add(ChangeTheme(true));
    }
    _bloc.add(FetchSettings());
  }

  void _changeVibration() {
    if (_bloc.settings.isVibration) {
      _bloc.add(ChangeVibration(false));
    } else {
      _bloc.add(ChangeVibration(true));
    }
    _bloc.add(FetchSettings());
  }

  void _changeViewMode() {
    if (_bloc.settings.viewCarouselIsEnabled) {
      _bloc.add(ChangeViewMode(false));
    } else {
      _bloc.add(ChangeViewMode(true));
    }
    _bloc.add(FetchSettings());
  }

  Widget _buildBackButton() {
    return Positioned(
      left: 20,
      top: 40,
      child: AppSmallFloatingActionButton(
        icon: Icons.arrow_back_ios_sharp,
        callback: () {
          Navigator.pop(context, false);
        },
      ),
    );
  }

  Widget _buildInfoButton() {
    return Positioned(
      right: 20,
      top: 40,
      child: AppSmallFloatingActionButton(
        icon: Icons.emoji_objects_outlined,
        iconSize: 20,
        callback: _showVersionPopupCard,
        heroTag: AppTags.heroShowVersion,
      ),
    );
  }

  Widget _buildLabel() {
    return const Positioned(
        top: 50,
        child: TextBorder(
          title: AppTitles.settings,
        ));
  }

}
