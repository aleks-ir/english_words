import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';

class WordCountDialog extends StatefulWidget {
  const WordCountDialog(
      {required this.callback,
      required this.title,
      required this.wordCount,
      this.iconColor = const Color(AppColors.green800),
      Key? key})
      : super(key: key);

  final Function(int) callback;
  final String title;
  final int wordCount;
  final Color iconColor;

  @override
  _WordCountDialogState createState() => _WordCountDialogState();
}

class _WordCountDialogState extends State<WordCountDialog> {
  late int _wordCount;

  @override
  void initState() {
    _wordCount = widget.wordCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Material(
        elevation: 2,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontFamily: "Verdana"),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(
                        initialItem: _wordCount - 1),
                    children:
                        List.generate(50, (index) => Text((index + 1).toString())),
                    onSelectedItemChanged: (value) {
                      setState(() {
                        _wordCount = value + 1;
                      });
                    },
                    itemExtent: 25,
                    diameterRatio: 1,
                    useMagnifier: true,
                    magnification: 1.1,
                    looping: false,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1,
                  height: 0,
                ),
                InkWell(
                  onTap: () {
                    widget.callback(_wordCount);
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
                        style: TextStyle(fontSize: 16, fontFamily: 'Verdana'),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
