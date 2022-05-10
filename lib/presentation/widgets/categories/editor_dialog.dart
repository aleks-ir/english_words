import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_colors.dart';
import 'package:word_study_puzzle/presentation/widgets/global/app_text_field.dart';

import 'colors_bar.dart';

class EditorDialog extends StatefulWidget {
  final String description;
  final int iconAssetIndex;
  final Function(String, int) editCategoryCallback;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? textColor;


  const EditorDialog({required this.description,
    required this.iconAssetIndex,
    required this.editCategoryCallback,
    this.backgroundColor,
    this.buttonColor = const Color(AppColors.green800),
    this.textColor,
    Key? key})
      : super(key: key);

  @override
  State<EditorDialog> createState() => _EditorDialogState();
}

class _EditorDialogState extends State<EditorDialog> {
  late TextEditingController _textFieldDescriptionController;
  late int _selectedIconIndex;

  @override
  void initState() {
    _textFieldDescriptionController = TextEditingController(text: widget.description);
    _selectedIconIndex = widget.iconAssetIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Material(
        color: widget.backgroundColor,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text(
                  "Description",
                  style: TextStyle(
                      fontSize: 14,
                      color: widget.textColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Verdana"),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              AppTextField(
                backgroundColor: widget.backgroundColor,
                controller: _textFieldDescriptionController,
                maxLines: 3,
              ),
              const SizedBox(
                height: 10,
              ),
              CategoriesIconBar(
                changeIndexCallback: (int index) {
                  setState(() {
                    _selectedIconIndex = index;
                  });
                },
                selectedIconIndex: _selectedIconIndex,
              ),

              const Divider(
                thickness: 1,
                height: 0,
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child:

                SizedBox(
                  width: 110,
                  child: MaterialButton(
                    onPressed: () {
                      widget.editCategoryCallback(_textFieldDescriptionController.text, _selectedIconIndex);
                      Navigator.pop(context);
                    },
                    textColor: const Color(AppColors.whiteDefault),
                    color: widget.buttonColor,
                    child: const Text("Save"),
                    height: 40,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),

              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}