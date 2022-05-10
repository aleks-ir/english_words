import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_init.dart';
import 'app_widget.dart';
import 'common/constants/box_names.dart';
import 'data/dto/category_dto.dart';
import 'data/dto/history_dto.dart';
import 'data/dto/settings_dto.dart';
import 'data/dto/word_dto.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  initHive();
  runApp(di.sl<AppWidget>());
}

void initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CategoryDtoAdapter());
  Hive.registerAdapter(WordDtoAdapter());
  Hive.registerAdapter(SettingsDtoAdapter());
  Hive.registerAdapter(HistoryDtoAdapter());
  await Hive.openBox(BoxNames.history);
  await Hive.openBox(BoxNames.categories);
  await Hive.openBox(BoxNames.settings).then((box) {
    di.sl<AppInit>().initLocalData(box);
    di.sl<AppInit>().initTheme(box);
  });
}
