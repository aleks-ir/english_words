import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/domain/models/history.dart';

import 'calendar_item.dart';


class Calendar extends StatelessWidget {
  late PageController _cardPageController;
  final Map<int, List<History>> historiesByMonths;
  final DateTime currentDate;
  final int initPage;

  Calendar(
      {required this.historiesByMonths,
      required this.initPage,
      required this.currentDate,
      Key? key})
      : super(key: key);

  void nextPage(){
    _cardPageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic);
  }

  void prevPage(){
    _cardPageController.previousPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic);
  }



  @override
  Widget build(BuildContext context) {
    _cardPageController = PageController(viewportFraction: 0.95, initialPage: initPage);
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: 420,
        child: PageView.builder(
            itemCount: 12,
            pageSnapping: true,
            controller: _cardPageController,
            itemBuilder: (context, pagePosition) {
              return monthSlider(pagePosition);
            }),
      ),
    );
  }

  AnimatedContainer monthSlider(int pagePosition) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(bottom: 20),
      curve: Curves.easeInOutCubic,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: CalendarItem(
        monthHistories: historiesByMonths[pagePosition + 1] ?? [],
        selectedDate: DateTime(currentDate.year, pagePosition + 1),
        pagePosition: pagePosition,
        currentDate: currentDate,
        nextPageCallback: nextPage,
        prevPageCallback: prevPage,
      ),
    );
  }

}
