import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:share_plus/share_plus.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/common/constants/app_themes.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_settings/settings_bloc.dart';
import 'package:word_study_puzzle/presentation/utils/hero_dialog_route.dart';
import 'package:word_study_puzzle/presentation/widgets/app_floating_action_buttons.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_border.dart';
import 'package:word_study_puzzle/presentation/widgets/settings/notification_popup_card.dart';
import 'package:word_study_puzzle/presentation/widgets/settings/settings_item.dart';
import 'package:word_study_puzzle/presentation/widgets/settings/version_popup_card.dart';
import 'package:word_study_puzzle/presentation/widgets/settings/word_count_popup_card.dart';
import 'package:word_study_puzzle/presentation/widgets/snack_bar.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late SettingsBloc _bloc;


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
                          top: 100, right: 20, left: 20, bottom: 20),
                      child: GridView.count(
                          crossAxisCount: isPortrait ? 2 : 4,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            SettingsGreedViewItem(
                              callback: _showWordCountDialog,
                              title: 'Daily words',
                              icon: Icons.track_changes,
                              tag: AppTags.heroChangeWordCount,
                            ),
                            SettingsGreedViewItem(
                              callback: settings.isNotification
                                  ? _turnOffNotification
                                  : _showNotificationDialog,
                              title: 'Notification',
                              icon: settings.isNotification
                                  ? Icons.notifications_active_outlined
                                  : Icons.notifications_none_outlined,
                              tag: AppTags.heroChangeNotification,
                            ),
                            SettingsGreedViewItem(
                              callback: _changeTheme,
                              title: 'Theme',
                              icon: settings.darkThemeIsEnabled
                                  ? Icons.nights_stay
                                  : Icons.light_mode,
                              tag: AppTags.heroChangeTheme,
                            ),
                            SettingsGreedViewItem(
                              callback: _changeVibration,
                              title: 'Vibration',
                              icon: settings.isVibration
                                  ? Icons.vibration
                                  : Icons.smartphone,
                              tag: AppTags.heroChangeVibration,
                            ),
                            SettingsGreedViewItem(
                              callback: _changeViewMode,
                              title: 'View mode',
                              icon: settings.viewCarouselIsEnabled
                                  ? Icons.view_carousel
                                  : Icons.style,
                              tag: AppTags.heroViewMode,
                            ),
                            SettingsGreedViewItem(
                              callback: _shareLink,
                              title: 'Share',
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
            title: 'Number of daily words to study',
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
            title: 'The time of notification',
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
            title: "Application version: 1.0",
          ),
        ),
      ),
    );
  }

  void _shareLink() {
    Share.share(' https://app.com', subject: 'Welcome Message');
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
        child: AppTextBorder(
          title: 'Settings',
        ));
  }

}
