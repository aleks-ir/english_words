import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/presentation/widgets/app_outlined_button.dart';

class NotificationPopupCard extends StatefulWidget {
  const NotificationPopupCard(
      {required this.callback,
      required this.title,
      required this.isNotification,
      required this.timeNotification,
      this.iconColor = const Color(AppColors.color2),
      Key? key})
      : super(key: key);

  final Function(String) callback;
  final String title;
  final bool isNotification;
  final String timeNotification;
  final Color iconColor;

  @override
  _NotificationPopupCardState createState() => _NotificationPopupCardState();
}

class _NotificationPopupCardState extends State<NotificationPopupCard> {
  late int _hour;
  late int _minute;

  @override
  void initState() {
    final timeNotification = widget.timeNotification.split(":");
    _hour = int.parse(timeNotification[0]);
    _minute = int.parse(timeNotification[1]);
    super.initState();
  }

  final fixedExtentScrollController =
      FixedExtentScrollController(initialItem: 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(32.0),
      child: Hero(
        tag: AppTags.heroChangeNotification,
        child: Material(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    widget.title,
                    style: const TextStyle(fontSize: 15, fontFamily: "Verdana"),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: 100,
                      width: 250,
                      child: CupertinoTimerPicker(
                        alignment: Alignment.topRight,
                        mode: CupertinoTimerPickerMode.hm,
                        initialTimerDuration:
                            Duration(hours: _hour, minutes: _minute),
                        onTimerDurationChanged: (value) {
                          _hour = value.inHours;
                          _minute =  value.inMinutes - value.inHours * 60;
                          setState(() {});
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    thickness: 1,
                    height: 0,
                  ),
                  InkWell(
                    onTap: () {
                      final time = "$_hour:$_minute";
                      widget.callback(time);
                      Navigator.of(context).pop();
                    },
                    customBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                    ),
                    splashColor: Colors.grey.withOpacity(0.1),
                    child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: const Text(
                          'Confirm',
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Verdana',
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void increaseHour() {
    if (_hour < 24) {
      _hour++;
    } else {
      _hour = 0;
    }
    setState(() {});
  }

  void decreaseHour() {
    if (_hour > 0) {
      _hour--;
    } else {
      _hour = 23;
    }
    setState(() {});
  }

  void increaseMinute() {
    if (_minute < 60) {
      _minute++;
    } else {
      _minute = 0;
    }
    setState(() {});
  }

  void decreaseMinute() {
    if (_minute > 0) {
      _minute--;
    } else {
      _minute = 60;
    }
    setState(() {});
  }
}
