import 'package:hive_flutter/adapters.dart';
import 'package:word_study_puzzle/app_local_data.dart';
import 'package:word_study_puzzle/common/constants/box_names.dart';
import 'package:word_study_puzzle/data/dto/category_dto.dart';
import 'package:word_study_puzzle/data/dto/history_dto.dart';
import 'package:word_study_puzzle/data/dto/settings_dto.dart';
import 'package:word_study_puzzle/data/dto/word_dto.dart';
import 'package:word_study_puzzle/injection_container.dart' as di;

class AppTest {
  static void setUp() async {
    await di.init();
    await Hive.initFlutter();
    Hive.registerAdapter(CategoryDtoAdapter());
    Hive.registerAdapter(WordDtoAdapter());
    Hive.registerAdapter(SettingsDtoAdapter());
    Hive.registerAdapter(HistoryDtoAdapter());
    await Hive.openBox(BoxNames.history);
    await Hive.openBox(BoxNames.categories);
    await Hive.openBox(BoxNames.settings)
        .then((box) => di.sl<AppInit>().initLocalData(box));
  }
}
