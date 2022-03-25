import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:word_study_puzzle/common/constants/app_tags.dart';
import 'package:word_study_puzzle/common/constants/app_widget_keys.dart';

class Selectors{

  static String selectActionTitle(String type){
    if(type == WordsPageKeys.unexploredWordsKey){
      return 'Study';
    }else if(type == WordsPageKeys.exploringWordsKey){
      return 'Remove';
    }else{
      return 'Delete';
    }
  }

  static IconData selectActionIcon(String type){
    if(type == WordsPageKeys.unexploredWordsKey){
      return Icons.forward;
    }else if(type == WordsPageKeys.exploringWordsKey){
      return Icons.remove;
    }else{
      return Icons.delete;
    }
  }

  static String selectActionTag(String type){
    if(type == WordsPageKeys.unexploredWordsKey){
      return AppTags.heroAddInExplore;
    }else if(type == WordsPageKeys.exploringWordsKey){
      return AppTags.heroRemoveFromExplore;
    }else{
      return AppTags.heroDeleteWords;
    }
  }

  static String selectTitle(String type) {
    if (type == WordsPageKeys.exploringWordsKey) {
      return 'In study';
    } else if (type == WordsPageKeys.unexploredWordsKey) {
      return 'Unstudied';
    } else {
      return 'Words';
    }
  }

}