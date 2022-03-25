import 'package:flutter/material.dart';

class FlowItem {
  String title;
  dynamic icon;
  VoidCallback callback;
  String type;
  double size;
  
  FlowItem({
    required this.title, 
    required this.icon,
    required this.callback,
    required this.type,
    required this.size});
}