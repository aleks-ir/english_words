import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

SnackBar snackBar({required String title, Color color = Colors.grey, SnackBarAction? action}) {
  return SnackBar(
    content: Text(title),
    backgroundColor: color,
    elevation: 10,
    behavior: SnackBarBehavior.floating,
    margin: const EdgeInsets.all(10),
    action: action,
  );
}


