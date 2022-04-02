import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/calendar.dart';
import 'package:word_study_puzzle/domain/models/history.dart';
import 'package:word_study_puzzle/presentation/utils/selectors.dart';

class CalendarPage extends StatelessWidget {
  final List<History> monthHistories;
  final DateTime selectedDate;
  final DateTime currentDate;
  final int pagePosition;
  final VoidCallback nextPageCallback;
  final VoidCallback prevPageCallback;
  final Color backgroundColor;
  final Color iconColor;
  final Color textColor;
  late int indexOfFirstDayMonth;

  CalendarPage(
      {required this.monthHistories,
      required this.selectedDate,
      required this.currentDate,
      required this.pagePosition,
      required this.nextPageCallback,
      required this.prevPageCallback,
      this.backgroundColor = const Color(AppColors.color2),
      this.iconColor = const Color(AppColors.selectedItemColor),
      this.textColor = const Color(AppColors.selectedItemColor),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    indexOfFirstDayMonth = getIndexOfFirstDayInMonth(selectedDate);
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: isPortrait ? 15 : MediaQuery.of(context).size.width / 4),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0.1,
              blurRadius: 7,
              offset: const Offset(0, 7.75),
            ),
          ]),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  pagePosition != 0
                      ? IconButton(
                          splashRadius: 1,
                          onPressed: prevPageCallback,
                          icon: const Icon(
                            Icons.skip_previous,
                            size: 23,
                            color: Color(AppColors.color2),
                          ))
                      : const SizedBox(
                          width: 23,
                        ),
                  Text(
                    monthsOfYear[selectedDate.month - 1],
                    style: const TextStyle(
                        color: Color(AppColors.color1),
                        fontSize: 17,
                        fontFamily: 'Verdana'),
                  ),
                  pagePosition != 11
                      ? IconButton(
                          splashRadius: 1,
                          onPressed: nextPageCallback,
                          icon: const Icon(
                            Icons.skip_next,
                            size: 23,
                            color: Color(AppColors.color2),
                          ))
                      : const SizedBox(
                          width: 23,
                        ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 7,
                ),
                itemCount: listOfDatesInMonth(selectedDate).length +
                    indexOfFirstDayMonth,
                itemBuilder: (BuildContext context, int index) {
                  final day = _getDayByIndex(index);
                  final historyExploredRate = _getHistoryExploredRate(day);
                  final isCurrentDate = _checkCurrentDate(day);
                  return Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Selectors.selectExploredColor(
                                  historyExploredRate),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            Selectors.selectCellText(
                                index, indexOfFirstDayMonth, day),
                            style: Selectors.selectCellTextStyle(
                                index, historyExploredRate, isCurrentDate),
                          )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _checkCurrentDate(int day){
    return selectedDate.month == currentDate.month && day == currentDate.day;
  }

  List<int> listOfDatesInMonth(DateTime currentDate) {
    var selectedMonthFirstDay =
        DateTime(currentDate.year, currentDate.month, currentDate.day);
    var nextMonthFirstDay = DateTime(selectedMonthFirstDay.year,
        selectedMonthFirstDay.month + 1, selectedMonthFirstDay.day);
    var totalDays = nextMonthFirstDay.difference(selectedMonthFirstDay).inDays;

    var listOfDates = List<int>.generate(totalDays, (i) => i + 1);
    return (listOfDates);
  }

  int getIndexOfFirstDayInMonth(DateTime date) {
    var day = DateFormat('EEE').format(date).toUpperCase();
    return daysOfWeek.indexOf(day) + daysOfWeek.length;
  }

  int _getDayByIndex(int index) {
    return index + 1 - indexOfFirstDayMonth;
  }

  double _getHistoryExploredRate(int day) {
    final history = monthHistories.firstWhere(
        (element) => DateTime.parse(element.date).day == day,
        orElse: () => History(date: ''));
    if (history.wordExploredCount == 0) {
      return 0;
    } else {
      return history.wordExploredCount / history.wordToExploreCount;
    }
  }
}
