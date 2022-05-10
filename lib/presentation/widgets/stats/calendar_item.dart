import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/common/constants/calendar.dart';
import 'package:word_study_puzzle/domain/models/history.dart';
import 'package:word_study_puzzle/presentation/utils/selectors.dart';

class CalendarItem extends StatelessWidget {
  final List<History> monthHistories;
  final DateTime selectedDate;
  final DateTime currentDate;
  final int pagePosition;
  final VoidCallback nextPageCallback;
  final VoidCallback prevPageCallback;
  final Color iconColor;
  final Color textColor;
  late int indexOfFirstDayMonth;

  CalendarItem(
      {required this.monthHistories,
      required this.selectedDate,
      required this.currentDate,
      required this.pagePosition,
      required this.nextPageCallback,
      required this.prevPageCallback,
      this.iconColor = const Color(AppColors.green700),
      this.textColor = const Color(AppColors.green800),
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    indexOfFirstDayMonth = getIndexOfFirstDayInMonth(selectedDate);
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
          horizontal: isPortrait ? 15 : MediaQuery.of(context).size.width / 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
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
                          icon: Icon(
                            Icons.skip_previous,
                            size: 23,
                            color: iconColor,
                          ))
                      : const SizedBox(
                          width: 23,
                        ),
                  Text(
                    monthsOfYear[selectedDate.month - 1],
                    style: const TextStyle(fontSize: 17, fontFamily: 'Verdana'),
                  ),
                  pagePosition != 11
                      ? IconButton(
                          splashRadius: 1,
                          onPressed: nextPageCallback,
                          icon: Icon(
                            Icons.skip_next,
                            size: 23,
                            color: iconColor,
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
                  final history = _getHistory(day);
                  final exploredRate = _getExploredRate(history);
                  final isCurrentDate = _checkCurrentDate(day);
                  return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Stack(
                        children: [
                          Positioned(
                            child: exploredRate == 0 ||
                                    index < indexOfFirstDayMonth
                                ? const SizedBox()
                                : Icon(
                                    Icons.whatshot,
                                    color: Selectors.selectIconColor(
                                        history.awardWasReceived),
                                    size: 10,
                                  ),
                            right: 0,
                          ),
                          Center(
                            child: Text(
                              Selectors.selectCellText(
                                  index, indexOfFirstDayMonth, day),
                              style: Selectors.selectCellTextStyle(
                                  index, exploredRate, isCurrentDate),
                            ),
                          ),
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _checkCurrentDate(int day) {
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

  History _getHistory(int day) {
    return monthHistories.firstWhere(
            (element) => DateTime.parse(element.date).day == day,
        orElse: () => History(date: ''));
  }
  
  double _getExploredRate(History history) {
    if (history.wordExploringCount == 0) {
      return 0;
    } else {
      return history.wordExploringCount / history.wordToExploreCount;
    }
  }
}
