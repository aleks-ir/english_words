import 'dart:math';

import 'package:flutter/material.dart';
import 'package:word_study_puzzle/domain/models/word.dart';
import 'package:word_study_puzzle/presentation/widgets/home/home_back_card.dart';
import 'package:word_study_puzzle/presentation/widgets/home/home_front_card.dart';

import 'home_shimmer_card.dart';

class HomeFlipCard extends StatefulWidget {
  const HomeFlipCard({
    required this.selectLetterCallback,
    required this.unselectLetterCallback,
    required this.imageUrlList,
    required this.word,
    required this.openWordCallback,
    required this.resetWordCallback,
    Key? key,
  }) : super(key: key);

  final Word word;
  final List<String> imageUrlList;
  final Function(Word, int) selectLetterCallback;
  final Function(Word, int) unselectLetterCallback;
  final Function(Word) openWordCallback;
  final Function(Word) resetWordCallback;

  @override
  _HomeFlipCardState createState() => _HomeFlipCardState();
}

class _HomeFlipCardState extends State<HomeFlipCard> {
  bool _showBackSide = false;
  bool _flipXAxis = true;
  bool _isVisibleHelp = false;

  @override
  Widget build(BuildContext context) {
    _flipXAxis = MediaQuery.of(context).orientation == Orientation.portrait;
    _showBackSide = widget.word.isAnswered ?? false;
    if (!_showBackSide && (widget.word.isAnswered ?? false)) {
      _switchCard();
    }


    return Container(
      child: _buildFlipAnimation(),
    );
  }

  void _switchCard() {
    Future.delayed(const Duration(milliseconds: 0), () {
      setState(() {
        _showBackSide = true;
      });
    });
  }

  void _switchShowHelp() {
    setState(() {
      _isVisibleHelp = _isVisibleHelp ? false : true;
    });
  }

  void _selectLetterCallback(Word word, int index) {
    widget.selectLetterCallback(word, index);
    _hideHelp();
  }

  void _unselectLetterCallback(Word word, int index) {
    widget.unselectLetterCallback(word, index);
    _hideHelp();
  }

  _hideHelp() {
    if (_isVisibleHelp) {
      setState(() {
        _isVisibleHelp = false;
      });
    }
  }

  Widget _buildFlipAnimation() {
    return !widget.word.isLoaded
        ? HomeShimmerCard()
        : AnimatedSwitcher(
            duration: const Duration(milliseconds: 800),
            transitionBuilder: __transitionBuilder,
            layoutBuilder: (widget, list) =>
                Stack(children: [widget!, ...list]),
            child: _showBackSide
                ? HomeBackCard(
                    imageUrlList: widget.imageUrlList,
                    word: widget.word,
                    key: const ValueKey(false),
                  )
                : HomeFrontCard(
                    imageUrlList: widget.imageUrlList,
                    word: widget.word,
                    key: const ValueKey(true),
                    selectLetterCallback: _selectLetterCallback,
                    unselectLetterCallback: _unselectLetterCallback,
                    resetWordCallback: () {
                      widget.resetWordCallback(widget.word);
                    },
                    openWordCallback: () {
                      widget.openWordCallback(widget.word);
                      _switchCard();
                    },
                    switchShowHelp: _switchShowHelp,
                    isVisibleHelp: _isVisibleHelp,
                  ),
            switchInCurve: Curves.easeInBack,
            switchOutCurve: Curves.easeInBack.flipped,
          );
  }

  Widget __transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showBackSide) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: _flipXAxis
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }
}
